class DashboardController < ApplicationController
  before_filter :require_login

  def index
    @recent_transactions = current_user.transactions.recent(5)
    @current_budgets = current_user.budgets.current

    @stats = {}
    [:this_month, :'30d', :'90d', :'180d', :total].each do |tf|
      @stats[tf] ||= {}
    end

    @stats[:this_month][:spendings] = current_user.transaction_items.spendings.between(Time.zone.now.beginning_of_month.beginning_of_day, Time.zone.now.end_of_month.end_of_day).sum(:amount)
    @stats[:'30d'][:spendings] = current_user.transaction_items.spendings.between(Time.zone.now-30.days, Time.zone.now).sum(:amount)
    @stats[:'90d'][:spendings] = current_user.transaction_items.spendings.between(Time.zone.now-90.days, Time.zone.now).sum(:amount)
    @stats[:'180d'][:spendings] = current_user.transaction_items.spendings.between(Time.zone.now-180.days, Time.zone.now).sum(:amount)
    @stats[:total][:spendings] = current_user.transaction_items.spendings.prior_to(Time.zone.now).sum(:amount)

    @stats[:this_month][:earnings] = current_user.transaction_items.earnings.between(Time.zone.now.beginning_of_month.beginning_of_day, Time.zone.now.end_of_month.end_of_day).sum(:amount)
    @stats[:'30d'][:earnings] = current_user.transaction_items.earnings.between(Time.zone.now-30.days, Time.zone.now).sum(:amount)
    @stats[:'90d'][:earnings] = current_user.transaction_items.earnings.between(Time.zone.now-90.days, Time.zone.now).sum(:amount)
    @stats[:'180d'][:earnings] = current_user.transaction_items.earnings.between(Time.zone.now-180.days, Time.zone.now).sum(:amount)
    @stats[:total][:earnings] = current_user.transaction_items.earnings.prior_to(Time.zone.now).sum(:amount)

    @stats[:this_month][:days] = Time.days_in_month(Time.zone.now.month)
    @stats[:'30d'][:days] = 30
    @stats[:'90d'][:days] = 90
    @stats[:'180d'][:days] = 180
    transactions = current_user.transactions.chronological_order
    @stats[:total][:days] = (transactions.last.timestamp - transactions.first.timestamp)/1.day
    
    [:this_month, :'30d', :'90d', :'180d', :total].each do |tf|
      @stats[tf][:result] = @stats[tf][:spendings] + @stats[tf][:earnings]
      @stats[tf][:spendings_per_day] = @stats[tf][:spendings] / @stats[tf][:days]
      @stats[tf][:earnings_per_day] = @stats[tf][:earnings] / @stats[tf][:days]
      @stats[tf][:result_per_day] = @stats[tf][:result] / @stats[tf][:days]
    end
  end
end
