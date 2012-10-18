class AddCheckerToGeocachings < ActiveRecord::Migration
  def self.up
    add_column :geocachings, :checker, :string
  end

  def self.down
    remove_column :geocachings, :checker
  end
end
