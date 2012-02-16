class WhurlCreateWhurlsTable < ActiveRecord::Migration
  def self.up
    create_table :whurls do |t|
      t.string :hash_key, :limit => 6, :null => false
      t.text :data
      t.timestamps
    end
    add_index :whurls, :hash_key, :unique => true
  end

  def self.down
    drop_table :whurls
  end
end
