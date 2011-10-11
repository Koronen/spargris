class BudgetPost < ActiveRecord::Base
  attr_accessible :user_id, :name, :description, :parent_id

  belongs_to :user

  has_many :budget_items
  has_many :budgets, :through => :budget_items
  has_many :transaction_items
  has_many :transactions, :through => :transaction_items

  validates_presence_of :name

  default_scope order("name ASC")
end

