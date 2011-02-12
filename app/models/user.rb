class User < ActiveRecord::Base
  acts_as_authentic

  has_many :accounts
  has_many :transactions

  acts_as_tagger
end
