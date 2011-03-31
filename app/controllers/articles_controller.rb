class ArticlesController < ApplicationController
  
  def index
    Scrapper.update_feed
    @articles = Article.all
    
    respond_to do |format|
      format.rss
    end
  end
  
end
