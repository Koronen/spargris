class CreateBudgetItems < ActiveRecord::Migration
  def self.up
    create_table :budget_items do |t|
      t.integer :budget_id, :null => false, :default => 0
      t.integer :budget_post_id, :null => false, :default => 0
      t.float :amount, :null => false, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :budget_items
  end
end
