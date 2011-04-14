require 'nokogiri'  
require 'open-uri'

module Scraper
  def self.update_feed
    if (Time.now - Configuration.first.rake_last_run) > 10.minutes
      articles_ids = Article.select("link_id").all.map(&:link_id)
      kinds = %w(uni social science culture sport)

      kinds.each do |kind|
        url = "http://iuni.ru/articles/#{kind}"  
        doc = Nokogiri::HTML(open(url)) 

        doc.css(".info").each do |item|
          heading  = item.at_css("h3") || item.at_css("h1")
          next unless heading
          
          link = heading.at_css("a")
          id = link[:href][/[0-9]+/].to_i

          unless articles_ids.include?(id)
            desc = item.at_css("h4") || item.at_css("h2")
            Article.create(:link_id => id, :title => link.text, :kind => kind, :description => desc.try(:text))   
          end
        end
      end
      Configuration.first.update_attribute(:rake_last_run, Time.now)
    end
  end
end