class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :vendor
  belongs_to :location

  validates_presence_of :timestamp, :amount
end
