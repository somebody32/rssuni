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

        doc.css(".news, .newsBig").each do |item|
          link = item.at_css("a.title")
          id = link[:href][/[0-9]+/].to_i

          unless articles_ids.include?(id)
            desc = item.at_css(".subTitle") || item.at_css(".subtitle")
            Article.create(:link_id => id, :title => link.text, :kind => kind, :description => desc.try(:text))   
          end
        end
      end
      Configuration.first.update_attribute(:rake_last_run, Time.now)
    end
  end
end