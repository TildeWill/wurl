class WhurlCreateChaptersTable < ActiveRecord::Migration
  def change
    create_table :whurl_engine_chapters do |t|
      t.string :title
      t.text :description
      t.integer :whurl_id
      t.integer :story_id
      t.timestamps
    end
  end
end
