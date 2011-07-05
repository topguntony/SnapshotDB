class SetPasswordsController < ApplicationController
  skip_before_filter :require_user
  before_filter :load_user_with_perishable_token
  layout 'user_sessions'
  
  def show
    current_user_session.destroy if current_user
  end
  
  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Your account has now been created"
      redirect_to dashboard_path
    else
      render :show
    end
  end
  
  private
  
  def load_user_with_perishable_token
    @user = User.find_by_perishable_token(params[:id])
    unless @user
      render :file => '/public/404.html', :layout => false
    end
  end
end
