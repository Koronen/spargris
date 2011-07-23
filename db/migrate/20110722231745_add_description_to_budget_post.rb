class AddDescriptionToBudgetPost < ActiveRecord::Migration
  def self.up
    add_column :budget_posts, :description, :string
  end

  def self.down
    remove_column :budget_posts, :description
  end
end
