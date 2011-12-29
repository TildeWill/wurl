class RenameWhurlRequestsToRequests < ActiveRecord::Migration
  def change
    rename_table :whurl_engine_whurl_requests, :whurl_engine_requests
  end
end
