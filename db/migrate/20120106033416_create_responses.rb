class CreateResponses < ActiveRecord::Migration
  def change
    create_table :whurl_engine_responses do |t|
      t.integer :request_id
      t.string :content_type
      t.text :body
      t.text :headers
      t.timestamps
    end
  end
end
