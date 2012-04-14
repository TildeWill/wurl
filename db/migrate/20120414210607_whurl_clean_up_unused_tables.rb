class WhurlCleanUpUnusedTables < ActiveRecord::Migration
  def up
    drop_table :whurl_engine_categories
    drop_table :whurl_engine_chapters
    drop_table :whurl_engine_header_definitions
    drop_table :whurl_engine_parameter_definitions
    drop_table :whurl_engine_resources
    drop_table :whurl_engine_stories
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
