class AddTimeZoneToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :time_zone, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :time_zone, :users
  end
end
