class CreateMulticachings < ActiveRecord::Migration
  def self.up
    create_table :multicachings do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :multicachings
  end
end
