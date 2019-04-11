require 'nokogiri'
require 'open-uri'

	city_halls = []

	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	

	page.search('.lientxt').each do |mairie|

		city_halls << mairie.text
		#puts city_halls
	
	end
	

	city_links = []

	page.search('.lientxt').each do |mairie|

		city_links << mairie["href"][1..-1]
		
		#puts city_links
	end

	city_mails = []

	for i in (0...city_links.length)

		 page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{city_links[i]}"))

		 page.xpath('/html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|

		 	city_mails << mail.text

		 	#puts city_mails
		end
	end


	cities = city_halls.zip(city_mails)

	puts cities