class AddMulticachingIdToGeocaching < ActiveRecord::Migration
  def self.up
    add_column :geocachings, :multicaching_id, :integer
  end

  def self.down
    remove_column :geocachings, :multicaching_id
  end
end
