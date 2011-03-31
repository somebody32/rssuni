class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :link_id
      t.string :title
      t.string :kind

      t.timestamps
    end
    add_index :articles, :link_id
  end

  def self.down
    remove_index :articles, :link_id
    drop_table :articles
  end
end