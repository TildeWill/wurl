class AddDescriptionToWhurlRequests < ActiveRecord::Migration
  def self.up
    add_column :whurl_engine_whurl_requests, :description, :string
  end

  def self.down
    remove_column :whurl_engine_whurl_requests, :description
  end
end
