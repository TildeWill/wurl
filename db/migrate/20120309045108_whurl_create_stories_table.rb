class WhurlCreateStoriesTable < ActiveRecord::Migration
  def change
    create_table :whurl_engine_stories do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
