class RenameWhurlEngineWhurlsToWurls < ActiveRecord::Migration
  def change
    rename_table :whurl_engine_whurls, :wurls
  end
end
