require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://iuni.ru/articles/uni"  
doc = Nokogiri::HTML(open(url)) 
 
doc.css(".news > a.title").each do |item|  
  puts item[:href][/[0-9]+/]  
end