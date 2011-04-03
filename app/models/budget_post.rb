class BudgetPost < ActiveRecord::Base
  belongs_to :user

  has_many :transactions

  validates_presence_of :name
end
