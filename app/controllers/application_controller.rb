class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user
    flash[:alert] = "Gotta be logged in to go there." unless current_user
    redirect_to root_path unless current_user
  end
end
