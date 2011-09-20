class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session].reject{|k,v| k == "commit"})
    if @user_session.save
      # notify the user of successful login
      flash[:notice] = "Successfully logged in."

      # redirect to saved url if set, root_url otherwise
      if return_to = session[:return_to]
        session[:return_to] = nil
        redirect_to return_to
      else
        redirect_to root_url
      end
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
