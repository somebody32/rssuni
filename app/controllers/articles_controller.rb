class ArticlesController < ApplicationController
  
  def index
    #call_rake('scrap')
    Article.update_feed
    @articles = Article.all
    
    respond_to do |format|
      format.rss
    end
  end
  
end
