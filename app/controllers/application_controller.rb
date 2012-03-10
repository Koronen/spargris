class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :set_user_language
  before_filter :set_user_time_zone

private

  # before filter
  def set_user_language
    I18n.locale = current_user.language if user_signed_in?
  end

  # before filter
  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end
end
