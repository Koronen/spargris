class BudgetPost < ActiveRecord::Base
  belongs_to :user

  has_many :budget_items
  has_many :budgets, :through => :budget_items
  has_many :transaction_items
  has_many :transactions, :through => :transaction_items

  validates_presence_of :name
end

