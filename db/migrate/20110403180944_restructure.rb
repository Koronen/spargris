class Restructure < ActiveRecord::Migration
  def self.up
    remove_column :budgets, :amount

    rename_table :categories, :budget_posts
    add_column :budget_posts, :user_id, :integer

    remove_column :transactions, :amount
    rename_column :transactions, :comment, :description
    remove_column :transactions, :account_id
    remove_column :transactions, :location_id
    remove_column :transactions, :category_id

    add_column :vendors, :user_id, :integer
  end

  def self.down
    add_column :budgets, :amount, :float

    rename_table :budget_posts, :categories
    remove_column :budget_posts, :user_id

    add_column :transactions, :amount, :float
    rename_column :transactions, :description, :comment
    add_column :transactions, :account_id, :integer
    add_column :transactions, :location_id, :integer
    add_column :transactions, :category_id, :integer

    remove_column :vendors, :user_id
  end
end

