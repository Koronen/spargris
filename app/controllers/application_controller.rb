class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user, :logged_in?
  
  protect_from_forgery

  before_filter :set_user_time_zone

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def logged_in?
    !current_user.nil?
  end

  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end
end
