class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  validates_presence_of :timestamp

  acts_as_taggable

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

  scope :with_description, lambda {
    where('description IS NOT NULL')
  }
end
