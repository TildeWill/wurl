class CreateFieldsForWhurlRequests < ActiveRecord::Migration
  def self.up
    add_column :whurl_engine_whurl_requests, :http_method, :string, :limit => 10
    add_column :whurl_engine_whurl_requests, :body, :text
    add_column :whurl_engine_whurl_requests, :query, :text
    add_column :whurl_engine_whurl_requests, :headers, :text
    add_column :whurl_engine_whurl_requests, :url, :text

  end

  def self.down
    remove_column :whurl_engine_whurl_requests, :http_method
    remove_column :whurl_engine_whurl_requests, :body
    remove_column :whurl_engine_whurl_requests, :query
    remove_column :whurl_engine_whurl_requests, :headers
    remove_column :whurl_engine_whurl_requests, :url
  end
end
