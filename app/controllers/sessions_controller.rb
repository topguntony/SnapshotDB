class SessionsController < ApplicationController
  before_filter :require_registrar
    
  def index
    date = params[:date]
    @student = Student.find(params[:student_id])
    @sessions = @student.sessions.where(:date => date)
    render :json => @sessions.to_json(:only => [:reason_id, :period, :referrer_id, :id])
  end
  
  def create
    # TODO: deleting a period also needs to be done
    @date = params[:date]
    @student = Student.find(params[:student_id])
    if @student.update_attributes(params[:student])
      render :create, :layout => false
    else
      render :text => "LearningZoneForm.spinner.stop();alert('Please check that the reason and staff member are both filled in.');"
    end
  end
end
