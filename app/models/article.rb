require 'rake'
class Article < ActiveRecord::Base
  validates_presence_of :link_id, :title, :kind
  
  def self.update_feed
    load File.join(Rails.root, 'lib', 'tasks', 'scrapper.rake')
    Rake::Task[:scrap].invoke
  end
end
