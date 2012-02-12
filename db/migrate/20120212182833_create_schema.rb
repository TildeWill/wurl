class CreateSchema < ActiveRecord::Migration
  def up
    create_table :whurl_engine_categories do |t|
      t.string   :name
      t.text     :description
      t.timestamps
    end

    create_table :whurl_engine_header_definitions do |t|
      t.integer  :resource_id
      t.string   :name
      t.string   :example_value
      t.text     :description
      t.boolean  :required
      t.timestamps
    end

    create_table :whurl_engine_parameter_definitions do |t|
      t.integer  :resource_id
      t.string   :name
      t.string   :example_value
      t.text     :description
      t.boolean  :required
      t.timestamps
    end

    create_table :whurl_engine_resources do |t|
      t.integer  :category_id
      t.string   :base_uri
      t.string   :relative_path
      t.string   :http_method
      t.text     :description
      t.boolean  :rate_limited
      t.boolean  :requires_authentication
      t.text     :response_formats
      t.timestamps
    end

    create_table :whurl_engine_whurls do |t|
      t.string   :hash_key, :limit => 6,  :null => false
      t.string   :description
      t.string   :name
      t.string   :request_method, :limit => 10
      t.text     :request_body
      t.text     :request_parameters
      t.text     :request_headers
      t.text     :request_url
      t.integer  :resource_id
      t.text     :response_body
      t.string   :response_content_type
      t.text     :response_headers
      t.text     :raw_request
      t.timestamps
    end

    add_index :whurl_engine_whurls, [:hash_key], :name => :index_whurls_on_hash_key, :unique => true
  end
end
