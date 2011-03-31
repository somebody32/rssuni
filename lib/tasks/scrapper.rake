require 'scrapper'
include Scrapper

#desc "Scrap iUni"
task :scrap do
  Scrapper.update_feed
end