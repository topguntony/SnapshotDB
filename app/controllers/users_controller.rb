class UsersController < ApplicationController
  before_filter :require_admin
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    begin
      User.create!(params[:user])
      user = User.find_by_email(params[:user][:email])
      flash[:notice] = "#{user.email} was added as a user"
      redirect_to users_path
    rescue
      render :new
    end
  end
  
  def destroy
    user = User.find(params[:id])
    unless user.admin
      user.destroy
      flash[:notice] = "User was deleted!"
      redirect_to users_path
    else
      flash[:notice] = "Cant delete an admin!"
      redirect_to users_path
    end
  end
end
