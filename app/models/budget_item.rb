class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :budget_post

  attr_accessible :amount, :budget_post_id

  validates_presence_of :amount, :budget_post_id

  def spent
    @transaction_items ||= TransactionItem.for_budget_item(self)
    @spent ||= -@transaction_items.where("amount < 0").sum(:amount)
  end

  def earned
    @transaction_items ||= TransactionItem.for_budget_item(self)
    @earned ||= @transaction_items.where("amount >= 0").sum(:amount)
  end

  def sum
    @transaction_items ||= TransactionItem.for_budget_item(self)
    @sum ||= @transaction_items.sum(:amount)
  end

  def difference
    @diff ||= self.sum - self.amount
  end
  alias :diff :difference
end

