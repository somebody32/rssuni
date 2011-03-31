require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://iuni.ru/articles/uni"  
doc = Nokogiri::HTML(open(url)) 
 
doc.css(".news, .newsBig").each do |item|
  puts item[:class]
  link = item.at_css("a.title")
  puts link.text
  #  id = link[:href][/[0-9]+/]
  # 
  #  unless Article.find_by_link_id(id)
  #    desc = item.at_css(".subTitle") || item.at_css(".subtitle")
  #    Article.create(:link_id => id, :title => link.text, :kind => kind, :description => desc.try(:text))   
  #  end
end