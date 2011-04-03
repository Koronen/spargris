class TransactionItem < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :budget_post

  validates_presence_of :amount

  scope :with_user_id, lambda { |uid|
    joins(:transaction).where('transactions.user_id == ?', uid)
  }

  scope :since, lambda { |time|
    joins(:transaction).where('transactions.timestamp >= ?', time)
  }

  scope :prior_to, lambda { |time|
    joins(:transaction).where('transactions.timestamp < ?', time)
  }

  scope :between, lambda { |from, to|
    since(from).prior_to(to)
  }

  def timestamp
    @timestamp ||= transaction.timestamp
  end
end

