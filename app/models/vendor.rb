class Vendor < ActiveRecord::Base
  belongs_to :user

  has_many :transactions

  validates_presence_of :name

  default_scope order("name ASC")
end
