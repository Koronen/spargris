class Category < ActiveRecord::Base
  has_many :transactions

  validates_presence_of :name
end
