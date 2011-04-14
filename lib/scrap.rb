require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://iuni.ru/articles/uni"  
doc = Nokogiri::HTML(open(url)) 
 
doc.css(".info").each do |item|
  heading  = item.at_css("h3") || item.at_css("h1")
  next unless heading
  
  link = heading.at_css("a")
  id = link[:href][/[0-9]+/].to_i
  puts link.text
  
  desc = item.at_css("h4") || item.at_css("h2")
  
  puts desc.text
  
  # unless articles_ids.include?(id)
  #     desc = item.at_css("h2") || item.at_css("h4")
  #     Article.create(:link_id => id, :title => link.text, :kind => kind, :description => desc.try(:text))   
  #   end
end