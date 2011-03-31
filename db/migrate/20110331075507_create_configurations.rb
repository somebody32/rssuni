class CreateConfigurations < ActiveRecord::Migration
  def self.up
    create_table :configurations do |t|
      t.datetime :rake_last_run
    end
    
    Configuration.create(:rake_last_run => Time.now-1.hour)
  end

  def self.down
    drop_table :configurations
  end
end
