class AddDecriptionToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles, :description, :string
  end

  def self.down
    remove_column :articles, :description
  end
end
