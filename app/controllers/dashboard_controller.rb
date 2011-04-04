class DashboardController < ApplicationController
  before_filter :require_login

  def index
    @recent_transactions = current_user.transactions.recent(5)
    @current_budgets = current_user.budgets.current
  end

end
