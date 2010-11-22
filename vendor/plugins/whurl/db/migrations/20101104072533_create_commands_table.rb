class CreateCommandsTable < ActiveRecord::Migration
  def self.up
    create_table :commands do |t|
      t.text :url, :null => false
      t.string :method, :method => false, :limit => 10
      t.text :param_keys
      t.text :param_values
      t.text :header_keys
      t.text :header_values
      t.timestamps
    end
  end

  def self.down
    drop_table :commands
  end
end
