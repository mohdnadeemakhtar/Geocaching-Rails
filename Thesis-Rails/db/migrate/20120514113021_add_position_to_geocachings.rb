class AddPositionToGeocachings < ActiveRecord::Migration
  def self.up
    add_column :geocachings, :position, :integer
  end

  def self.down
    remove_column :geocachings, :position
  end
end
