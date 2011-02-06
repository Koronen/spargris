class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  helper_method :current_user
  helper_method :logged_in?

  protect_from_forgery

  before_filter :set_user_language
  before_filter :set_user_time_zone

  private

  # helper helper method
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  # helper method
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  # helper method
  def logged_in?
    !current_user.nil?
  end

  # before filter
  def set_user_language
    I18n.locale = current_user.language if logged_in?
  end

  # before filter
  def set_user_time_zone
    Time.zone = current_user.time_zone if logged_in?
  end

  # before filter
  def require_login
    if logged_in?
      return true
    else
      flash[:warning] = 'Please login to continue'
      session[:return_to] = request.request_uri
      redirect_to login_url
      return false 
    end
  end

end
