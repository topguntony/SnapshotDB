class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :can_register?
  before_filter :do_not_cache, :require_user
  
  private
  
  def do_not_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  def require_admin
    unless current_user.admin
      redirect_to dashboard_path
    end
  end
  
  def require_registrar
    unless can_register?
      flash[:notice] = "You cant take registration. Sorry"
      redirect_to dashboard_path
    end
  end
  
  def can_register?
    current_user.can_register?
  end
  
  def require_user
    unless current_user
      redirect_to login_path
    end
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end
