class CreateParametersTable < ActiveRecord::Migration
  def change
    create_table :whurl_engine_parameters do |t|
      t.integer :resource_id
      t.string :name
      t.string :example_value
      t.text :description
      t.boolean :required
      t.timestamps
    end
  end
end
