class WhurlCreateFieldsForWhurlRequests < ActiveRecord::Migration
  def self.up
    add_column :whurl_engine_requests, :http_method, :string, :limit => 10
    add_column :whurl_engine_requests, :body, :text
    add_column :whurl_engine_requests, :query, :text
    add_column :whurl_engine_requests, :headers, :text
    add_column :whurl_engine_requests, :url, :text

  end

  def self.down
    remove_column :whurl_engine_requests, :http_method
    remove_column :whurl_engine_requests, :body
    remove_column :whurl_engine_requests, :query
    remove_column :whurl_engine_requests, :headers
    remove_column :whurl_engine_requests, :url
  end
end
