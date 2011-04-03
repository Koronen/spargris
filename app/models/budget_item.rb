class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :budget_post

  validates_presence_of :amount
end
