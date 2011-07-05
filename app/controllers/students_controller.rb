class StudentsController < ApplicationController
  
  def index
    redirect_to year_groups_path
  end
  
  def hours_per_week_by_reason
    @student = Student.find(params[:id])
    @sessions = @student.sessions.order('date DESC')
    @reasons = Reason.all
  end
  
  def hours_per_period_by_reason
    @student = Student.find(params[:id])
    @reasons = Reason.all
  end
  
  def show
    @reasons = Reason.all
    @student = Student.find(params[:id])
    @sessions = @student.sessions.order('date DESC')
    @days = @sessions.group(:date).count
    on_call = BehaviourOutcome.find_by_name("Duty Senior Team Call & Letter")
    @on_calls = @student.behaviour_logs.on_call
  end  
end
