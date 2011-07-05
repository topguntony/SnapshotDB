class StaffController < ApplicationController
  def index
    @staff = Staff.all
  end
  
  def show
    @staff = Staff.find(params[:id])
    @on_calls = @staff.behaviour_logs.on_call
  end
end
