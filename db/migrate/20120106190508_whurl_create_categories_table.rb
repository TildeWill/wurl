class WhurlCreateCategoriesTable < ActiveRecord::Migration
  def change
    create_table :whurl_engine_categories do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
