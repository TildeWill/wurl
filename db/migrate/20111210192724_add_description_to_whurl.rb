class AddDescriptionToWhurl < ActiveRecord::Migration
  def self.up
    add_column :whurls, :description, :string
  end

  def self.down
    remove_column :whurls, :description
  end
end
