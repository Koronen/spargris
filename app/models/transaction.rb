class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  has_many :transaction_items
  has_many :budget_posts, :through => :transaction_items
  accepts_nested_attributes_for :transaction_items, :allow_destroy => true

  validates_presence_of :timestamp

  def vendor_name
    self.vendor.name
  end

  def vendor_name=(name)
    self.vendor = Vendor.find_or_create_by_name(name)
  end

  acts_as_taggable

  scope :since, lambda { |time|
    where('timestamp >= ?', time)
  }

  scope :prior_to, lambda { |time|
    where('timestamp < ?', time)
  }

  scope :between, lambda { |from, to|
    since(from).prior_to(to)
  }

  scope :chronological_order, order("timestamp ASC")
  scope :reverse_chronological_order, order("timestamp DESC")

  scope :recent, lambda { |count| reverse_chronological_order.limit(count) }

  def amount
    @amount ||= transaction_items.sum(:amount)
  end
end

