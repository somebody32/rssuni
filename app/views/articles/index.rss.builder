xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0", :'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    xml.atom :link, nil, {
      :href => articles_url(:format => :rss),
      :rel => 'self', :type => 'application/rss+xml'
    }
    xml.title "iUni"
    xml.link articles_url(:format => :rss)
    xml.description "студенческий Петербург"
    xml.language "ru"
    
    for article in @articles
      xml.item do
        xml.title(article.title)
        xml.pubDate(article.created_at.to_s(:rfc822))
        xml.link("http://iuni.ru/articles/article/?articleId=#{article.link_id}")
        xml.guid(article.link_id, :isPermaLink => false)
        xml.description(article.description)      
      end
    end
  end
end

