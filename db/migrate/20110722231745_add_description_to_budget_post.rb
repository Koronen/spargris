class AddDescriptionToBudgetPost < ActiveRecord::Migration
  def self.up
    add_column :budget_posts, :description, :string, :null => false, :default => ""
  end

  def self.down
    remove_column :budget_posts, :description
  end
end
