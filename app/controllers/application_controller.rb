class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user
    flash[:alert] = "You gotta be logged in to do that." unless current_user
    redirect_to login_path unless current_user
  end
end
