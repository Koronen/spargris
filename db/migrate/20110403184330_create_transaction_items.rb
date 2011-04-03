class CreateTransactionItems < ActiveRecord::Migration
  def self.up
    create_table :transaction_items do |t|
      t.integer :transaction_id
      t.integer :budget_post_id
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :transaction_items
  end
end
