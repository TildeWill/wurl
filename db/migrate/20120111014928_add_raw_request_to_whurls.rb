class AddRawRequestToWhurls < ActiveRecord::Migration
  def change
    add_column :whurl_engine_whurls, :raw_request, :text
  end
end
