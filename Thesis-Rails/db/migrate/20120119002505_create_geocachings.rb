class CreateGeocachings < ActiveRecord::Migration
  def self.up
    create_table :geocachings do |t|
      t.string :address
      t.float :longitude
      t.float :latitude
      t.boolean :gmaps

      t.timestamps
    end
  end

  def self.down
    drop_table :geocachings
  end
end
