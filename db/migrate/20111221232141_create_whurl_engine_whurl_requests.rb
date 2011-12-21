class CreateWhurlEngineWhurlRequests < ActiveRecord::Migration
  def change
    create_table :whurl_engine_whurl_requests do |t|

      t.timestamps
    end
  end
end
