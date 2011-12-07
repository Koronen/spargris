class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
      t.datetime :start, :null => false, :default => 0
      t.datetime :end, :null => false, :default => 0
      t.float :amount, :null => false, :default => 0.0

      t.timestamps
    end
  end

  def self.down
    drop_table :budgets
  end
end
