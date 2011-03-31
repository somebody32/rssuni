class Article < ActiveRecord::Base
  validates_presence_of :link_id, :title, :kind
end
