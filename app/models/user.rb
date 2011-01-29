class User < ActiveRecord::Base
  acts_as_authentic

  has_many :accounts
  has_many :transactions
end
