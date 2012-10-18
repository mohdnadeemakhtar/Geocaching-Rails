class AddSummaryToGeocaching < ActiveRecord::Migration
  def self.up
    add_column :geocachings, :summary, :text
  end

  def self.down
    remove_column :geocachings, :summary
  end
end
