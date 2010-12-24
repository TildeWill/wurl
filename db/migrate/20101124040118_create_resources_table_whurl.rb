class CreateResourcesTable < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :url
      t.string :method, :method => false, :limit => 10
      t.boolean :ssl_required
      t.text :formats
      t.text :parameters
      t.text :headers
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
