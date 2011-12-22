class CreateWhurlRequestsTable < ActiveRecord::Migration
  def self.up
    create_table :whurl_engine_whurl_requests do |t|
      t.string :hash_key, :limit => 6, :null => false
      t.text :data
      t.timestamps
    end
    add_index :whurl_engine_whurl_requests, :hash_key, :unique => true
  end

  def self.down
    drop_table :whurl_engine_whurl_requests
  end
end
