class CreateTransactionItems < ActiveRecord::Migration
  def self.up
    create_table :transaction_items do |t|
      t.integer :transaction_id, :null => false, :default => 0
      t.integer :budget_post_id, :null => false, :default => 0
      t.float :amount, :null => false, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_items
  end
end
