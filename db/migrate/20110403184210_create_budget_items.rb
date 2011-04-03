class CreateBudgetItems < ActiveRecord::Migration
  def self.up
    create_table :budget_items do |t|
      t.integer :budget_id
      t.integer :budget_post_id
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :budget_items
  end
end
