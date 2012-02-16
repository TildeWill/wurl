class WhurlAddBasicAuthCredentials < ActiveRecord::Migration
  def change
    add_column :whurl_engine_whurls, :basic_auth_user, :string
    add_column :whurl_engine_whurls, :basic_auth_password, :string
  end
end
