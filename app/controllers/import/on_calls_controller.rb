class Import::OnCallsController < ApplicationController
  before_filter :require_admin
  
  def index
    @imports = BehaviourLogImport.order('created_at DESC')
  end
  
  def show
    @import = BehaviourLogImport.find(params[:id])
  end
  
  def create
    data = params[:df]
    @import = BehaviourLogImport.new
    FasterCSV.parse(data.read) do |row|
      student = Student.find_by_upn(row[0])
      behaviour_reason = BehaviourReason.find_or_create_by_name(row[2])
      behaviour_outcome = BehaviourOutcome.find_or_create_by_name(:name => row[1])
      staff = Staff.find(:first, :conditions =>{:first_name => row[6], :last_name => row[5]})
      location = Location.find_or_create_by_name(:name => row[3])  
      period = row[4]
      @import.behaviour_logs << BehaviourLog.new(:behaviour_reason => behaviour_reason, :behaviour_outcome => behaviour_outcome, :staff => staff, :date => row[1], :location => location, :period => period, :student => student)
    end
    
    if @import.save
      # OnCall.daily(@import).deliver
      flash[:notice] = "Imported #{@import.behaviour_logs.count} records"
      redirect_to import_on_call_path(@import)
    end    
  end
  
  def mail
    @import = BehaviourLogImport.find(params[:id])
    OnCall.daily(@import).deliver
    flash[:notice] = "Daily On Call Email Sent"
    redirect_to import_on_call_path(@import)
  end
  
  def destroy
    @import = BehaviourLogImport.find(params[:id])
    if @import.destroy
      flash[:notice] = "Import was destroyed"
      redirect_to import_on_calls_path
    end
  end
end
