class CreateHeaderDefinitionsTable < ActiveRecord::Migration
  create_table :whurl_engine_header_definitions do |t|
      t.integer :resource_id
      t.string :name
      t.string :example_value
      t.text :description
      t.boolean :required
      t.timestamps
    end
end
