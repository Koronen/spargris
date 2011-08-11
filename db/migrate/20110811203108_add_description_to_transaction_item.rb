class AddDescriptionToTransactionItem < ActiveRecord::Migration
  def self.up
    add_column :transaction_items, :description, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :transaction_items, :description
  end
end
