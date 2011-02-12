class AddUserToBudget < ActiveRecord::Migration
  def self.up
    add_column :budgets, :user_id, :integer
  end

  def self.down
    remove_column :budgets, :user_id
  end
end
