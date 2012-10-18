class AddNameToGeocaching < ActiveRecord::Migration
  def self.up
    add_column :geocachings, :name, :string
  end

  def self.down
    remove_column :geocachings, :name
  end
end
