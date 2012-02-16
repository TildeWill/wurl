class WhurlRenameRequestsToWhurls < ActiveRecord::Migration
  def up
    rename_table :whurl_engine_requests, :whurl_engine_whurls
    drop_table :whurl_engine_responses
    rename_column :whurl_engine_whurls, :custom_url, :name
    rename_column :whurl_engine_whurls, :query, :request_parameters
    rename_column :whurl_engine_whurls, :body, :request_body
    rename_column :whurl_engine_whurls, :headers, :request_headers
    rename_column :whurl_engine_whurls, :http_method, :request_method
    rename_column :whurl_engine_whurls, :url, :request_url
    add_column :whurl_engine_whurls, :resource_id, :integer
    add_column :whurl_engine_whurls, :response_body, :text
    add_column :whurl_engine_whurls, :response_content_type, :string
    add_column :whurl_engine_whurls, :response_headers, :text
  end

  def down
  end
end
