class YearGroupsController < ApplicationController
  def index
    @year_groups = YearGroup.all
  end
  
  def students_per_week_by_ethnicity
    @year_group = YearGroup.find(params[:id])
    @ethnicities = Ethnicity.joins(:students).where(:students => {:year_group_id => @year_group.id}).group('ethnicities.id, ethnicities.name, ethnicities.created_at, ethnicities.updated_at').order('name ASC')
  end
  
  def students_per_week_by_reason
    @year_group = YearGroup.find(params[:id])
    @sessions = @year_group.sessions
    @reasons = Reason.all
  end
  
  def students_per_week_by_gender
    @year_group = YearGroup.find(params[:id])
    @sessions = @year_group.sessions    
  end
  
  def show
    @year_group = YearGroup.find(params[:id])
    @students = @year_group.students.includes(:ethnicity).order('last_name ASC')
    @sessions = @year_group.sessions
    respond_to do |format|
      format.html
      format.json { 
        render :json => @students.to_json(:only => [:id, :first_name, :last_name])
      }
    end
  end
end
