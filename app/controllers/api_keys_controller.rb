class ApiKeysController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
    api_key = ApiKey.create
    if current_user.api_keys.empty?
      current_user.api_keys << api_key
      render :show
    else
      flash.now[:alert] = "Sorry #{current_user.name}, only one key per dev."
      render :show
    end
  end
end
