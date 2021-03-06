class TransactionItem < ActiveRecord::Base
  belongs_to :transaction
  belongs_to :budget_post

  attr_accessible :transaction_id, :amount, :budget_post_id, :description

  validates_presence_of :amount, :budget_post_id
  validates_numericality_of :amount

  scope :with_user_id, lambda { |uid|
    joins(:transaction).where('transactions.user_id = ?', uid)
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

  scope :spendings, where("amount < 0")
  scope :earnings, where("amount >= 0")

  scope :for_budget_item, lambda { |item|
    with_user_id(item.budget.user.id).between(item.budget.starts_at, item.budget.ends_at).where(:budget_post_id => item.budget_post.id)
  }

  def timestamp
    @timestamp ||= transaction.timestamp
  end
end

