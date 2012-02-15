class AddCustomUrlToWhurl < ActiveRecord::Migration
  def self.up
    add_column :whurls, :custom_url, :string
  end

  def self.down
    remove_column :whurls, :custom_url
  end
end
