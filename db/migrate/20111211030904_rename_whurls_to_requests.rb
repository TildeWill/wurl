class RenameWhurlsToRequests < ActiveRecord::Migration
  def change
    rename_table :whurls, :whurl_engine_requests
  end

  def down
  end
end
