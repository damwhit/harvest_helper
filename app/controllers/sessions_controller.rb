class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
    end
    flash[:info] = "Hi #{current_user.name} 👋"
    redirect_to plants_path
  end

  def destroy
    session.clear
    flash[:bye] = "Come back soon! 👋"
    redirect_to root_path
  end
end
