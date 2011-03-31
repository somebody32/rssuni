require 'scrapper'
include Scrapper

#desc "Scrap iUni"
task :scrap => :environment do
  Scrapper.update_feed
end