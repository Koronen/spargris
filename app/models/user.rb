class User < ActiveRecord::Base
  acts_as_authentic

  has_many :transactions
  has_many :budgets

  acts_as_tagger
end
