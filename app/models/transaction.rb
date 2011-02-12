class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :account
  belongs_to :vendor
  belongs_to :location
  belongs_to :category

  validates_presence_of :timestamp, :amount

  acts_as_taggable

  scope :debit, lambda {
    where('amount >= 0')
  }

  scope :credit, lambda {
    where('amount < 0')
  }

  scope :since, lambda { |time|
    where('timestamp >= ?', time)
  }

  scope :prior, lambda { |time|
    where('timestamp < ?', time)
  }

  scope :between, lambda { |from, to|
    since(from).prior(to)
  }

  scope :updated_since, lambda { |time|
    where('updated_at >= ?', time)
  }

  scope :commented, lambda {
    where('comment IS NOT NULL')
  }
end
