require 'nokogiri'  
require 'open-uri'

module Scraper
  def self.update_feed
    if (Time.now - Configuration.first.rake_last_run) > 10.minutes
      kinds = %w(uni social science culture sport)

      kinds.each do |kind|
        url = "http://iuni.ru/articles/#{kind}"  
        doc = Nokogiri::HTML(open(url)) 

        doc.css(".news").each do |item|
          link = item.at_css("a.title")
          id = link[:href][/[0-9]+/]

          unless Article.find_by_link_id(id)
            Article.create(:link_id => id, :title => link.text.strip, :kind => kind, :description => item.at_css(".subTitle").text.strip)   
          end
       end
      end
      Configuration.first.update_attribute(:rake_last_run, Time.now)
    end
  end
end