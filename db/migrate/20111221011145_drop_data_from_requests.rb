class DropDataFromRequests < ActiveRecord::Migration
  def self.up
    remove_column :whurl_engine_requests, :data
  end

  def self.down
    add_column :whurl_engine_requests, :data, :text
  end
end
