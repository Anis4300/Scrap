require 'nokogiri'
require 'open-uri'
   


	crypto_names = []
	
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	

	page.xpath('//tr/td[3]').each do |crypto|
	 
	crypto_names << crypto.text
	
	end
	
	crypto_prices = []

	page.xpath('//tr/td[5]/a').each do |price|
	
	crypto_prices << price.text

	end

	cryptos = crypto_names.zip(crypto_prices)

	puts cryptos