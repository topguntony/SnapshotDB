class DashboardsController < ApplicationController
  def show
    #@on_calls = BehaviourLog.where(:date => 6.days.ago..Date.today)
    @sessions = Session.where(:date => 6.days.ago..Date.today)
  end
  
  def on_calls
    @on_calls = BehaviourLog.limit(15)
  end
  
  def exclusions
    @exclusions = Exclusion.all
  end
end
