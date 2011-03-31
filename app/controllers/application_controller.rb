require 'scrapper'

class ApplicationController < ActionController::Base
  include Scrapper
  protect_from_forgery
end
