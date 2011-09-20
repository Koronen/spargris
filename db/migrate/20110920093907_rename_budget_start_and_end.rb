class RenameBudgetStartAndEnd < ActiveRecord::Migration
  def self.up
    rename_column :budgets, :start, :starts_at
    rename_column :budgets, :end, :ends_at
  end

  def self.down
    rename_column :budgets, :starts_at, :start
    rename_column :budgets, :ends_at, :end
  end
end
