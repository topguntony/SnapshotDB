class UserSessionsController < ApplicationController
  skip_before_filter :require_user
  def new
    @user = UserSession.new
  end
  
  def create
    @user = UserSession.new(params[:user_session])
    if @user.save
      redirect_to dashboard_path
    else
      flash[:error] = "Please check your login and try again"
      redirect_to login_path
    end
  end
  
  def destroy
    current_user_session.destroy unless !current_user
    redirect_to login_path
  end
end
