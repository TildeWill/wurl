class WhurlCreateResourcesTable < ActiveRecord::Migration
  def change
    create_table :whurl_engine_resources do |t|
      t.integer :category_id
      t.string :base_uri
      t.string :relative_path
      t.string :http_method
      t.text :description
      t.boolean :rate_limited
      t.boolean :requires_authentication
      t.text :response_formats
      t.timestamps
    end
  end
end
