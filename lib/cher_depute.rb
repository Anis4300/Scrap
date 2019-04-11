require 'nokogiri'
require 'open-uri'


deputy_names = []

i = 3

for i in (3..575)

	page = Nokogiri::HTML(open("https://www.mortchoisie.org/guide-pratique/d%c3%a9put%c3%a9s/index.html"))

	page.xpath("/html/body/div[1]/div/div[7]/div/div/div[2]/div[3]/table/tbody/tr[#{i}]/td[2]/p/span").each do |last_name|

		deputy_names << last_name.text


	i += 1

	end
end

deputy_mails = []

	page.xpath('//a[contains(@href, "mailto")]').each do |mail|
		
		deputy_mails << mail.text

	end

deputy_mails = deputy_mails[0..-2] # Il y avait un mail en trop, celui pour contacter le site, je l'ai enlevé.

	deputies = deputy_names.zip(deputy_mails)

	print deputies