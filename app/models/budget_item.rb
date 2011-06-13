class BudgetItem < ActiveRecord::Base
  attr_accessible :amount, :budget_post

  belongs_to :budget
  belongs_to :budget_post

  validates_presence_of :amount, :budget_post

  def spent
    @spent ||= TransactionItem.with_user_id(budget.user.id).between(budget.start, budget.end).where(:budget_post_id => budget_post.id).sum(:amount)
  end

  def left
    amount-spent
  end
end

