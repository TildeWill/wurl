class AddMessageToWhurls < ActiveRecord::Migration
  def change
    add_column :whurl_engine_whurls, :response_message, :string
  end
end
