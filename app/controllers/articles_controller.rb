class ArticlesController < ApplicationController
  
  def index
    Scraper.update_feed
    kind = nil
    if %w(uni social science culture sport).include? params[:kind]
      @articles = Article.where(:kind => params[:kind])
    else
      @articles = Article.all
    end
    
    
    respond_to do |format|
      format.rss
    end
  end
  
end
