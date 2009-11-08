class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.timestamps
      t.string :name
    end
    add_index :sources, :name
    
    create_table :domains_sources, :id => false do |t|
      t.belongs_to :domain
      t.belongs_to :source
    end
    add_index :domains_sources, :domain_id
    add_index :domains_sources, :source_id
  end

  def self.down
    drop_table :domains_sources
    drop_table :sources
  end
end
