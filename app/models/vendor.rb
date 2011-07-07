class Vendor < ActiveRecord::Base
  belongs_to :user

  has_many :transactions

  validates_presence_of :name

  scope :alphabetical_order, order("name ASC")
end
