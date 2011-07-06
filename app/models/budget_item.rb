class BudgetItem < ActiveRecord::Base
  belongs_to :budget
  belongs_to :budget_post

  attr_accessible :amount, :budget_post_id

  validates_presence_of :amount, :budget_post_id

  def spent
    @spent ||= TransactionItem.with_user_id(budget.user.id).between(budget.start, budget.end).where(:budget_post_id => budget_post.id).sum(:amount)
  end

  def left
    amount-spent
  end
end

