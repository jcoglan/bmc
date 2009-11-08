class CreateDomains < ActiveRecord::Migration
  def self.up
    create_table :domains do |t|
      t.timestamps
      t.string :host
    end
  end

  def self.down
    drop_table :domains
  end
end
