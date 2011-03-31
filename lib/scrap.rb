require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://iuni.ru/articles/uni"  
doc = Nokogiri::HTML(open(url)) 
 
doc.css(".news").each do |item|  
  puts item.at_css(".title")[:href][/[0-9]+/]
  puts item.at_css(".subTitle").text
end