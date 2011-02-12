class CreateBudgets < ActiveRecord::Migration
  def self.up
    create_table :budgets do |t|
      t.datetime :start
      t.datetime :end
      t.float :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :budgets
  end
end
