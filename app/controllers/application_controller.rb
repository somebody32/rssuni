require 'scraper'

class ApplicationController < ActionController::Base
  include Scraper
  protect_from_forgery
end
