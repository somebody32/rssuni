require 'nokogiri'  
require 'open-uri'

module Scrapper
  def update_feed
    if (Time.now - Configuration.first.rake_last_run) > 10.minutes
      kinds = %w(uni social science culture sport)

      kinds.each do |kind|
        url = "http://iuni.ru/articles/#{kind}"  
        doc = Nokogiri::HTML(open(url)) 

        doc.css("a.title").each do |item|
          id = item[:href][/[0-9]+/]

          unless Article.find_by_id(id)
            Article.create(:link_id => id, :title => item.text, :kind => kind)   
          end
        end
      end

      Configuration.first.update_attribute(:rake_last_run, Time.now)
    end
  end
end