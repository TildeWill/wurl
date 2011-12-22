class DropDataFromWhurlRequestss < ActiveRecord::Migration
  def self.up
    remove_column :whurl_engine_whurl_requests, :data
  end

  def self.down
    add_column :whurl_engine_whurl_requests, :data, :text
  end
end
