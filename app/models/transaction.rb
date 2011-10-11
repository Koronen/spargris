class Transaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :vendor

  has_many :transaction_items
  has_many :budget_posts, :through => :transaction_items
  accepts_nested_attributes_for :transaction_items, :allow_destroy => true

  #attr_accessible :timestamp, :vendor_name, :tag_list, :desctiption, :transaction_items_attributes

  validates_presence_of :timestamp

  def vendor_name
    self.vendor.try(:name)
  end

  def vendor_name=(name)
    self.vendor = Vendor.find_or_create_by_name(name)
  end

  acts_as_taggable

  default_scope order("timestamp DESC")

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

  scope :recent, lambda { |count| limit(count) }

  def amount
    @amount ||= transaction_items.sum(:amount)
  end
end

