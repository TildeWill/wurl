class AddCustomUrlToWhurlRequests < ActiveRecord::Migration
  def self.up
    add_column :whurl_engine_whurl_requests, :custom_url, :string
  end

  def self.down
    remove_column :whurl_engine_whurl_requests, :custom_url
  end
end
