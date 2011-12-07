class AddCategoryToTransaction < ActiveRecord::Migration
  def self.up
    add_column :transactions, :category_id, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :transactions, :category_id
  end
end
