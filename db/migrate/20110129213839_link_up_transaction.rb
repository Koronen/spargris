class LinkUpTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :user_id, :integer
    add_column :transactions, :account_id, :integer
    add_column :transactions, :vendor_id, :integer
    add_column :transactions, :location_id, :integer
  end

  def self.down
    remove_column :transactions, :user_id
    remove_column :transactions, :account_id
    remove_column :transactions, :vendor_id
    remove_column :transactions, :location_id
  end
end
