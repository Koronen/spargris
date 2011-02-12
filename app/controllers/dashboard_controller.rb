class DashboardController < ApplicationController
  before_filter :require_login

  def index
    @current_budgets = current_user.budgets.current
  end

end
