class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :vendor
  belongs_to :location
  belongs_to :category

  validates_presence_of :timestamp, :amount
end
