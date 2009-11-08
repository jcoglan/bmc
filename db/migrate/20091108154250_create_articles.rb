class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.timestamps
      t.belongs_to  :user
      t.string      :url
      t.string      :title
    end
    add_index :articles, :user_id
    add_index :articles, :url
  end

  def self.down
    drop_table :articles
  end
end