class User < ActiveRecord::Base
  acts_as_authentic

  has_many :transactions
  has_many :transaction_items, :through => :transactions
  has_many :budgets
  has_many :budget_items, :through => :budgets
  has_many :budget_posts
  has_many :vendors

  acts_as_tagger
end
