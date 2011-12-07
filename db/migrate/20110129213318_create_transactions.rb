class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.datetime :timestamp, :null => false, :default => "1970-01-01 00:00"
      t.float :amount, :null => false, :default => 0.0
      t.string :comment, :null => false, :default => ""

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
