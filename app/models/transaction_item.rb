class TransactionItem < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :budget_post

  validates_presence_of :amount
end
