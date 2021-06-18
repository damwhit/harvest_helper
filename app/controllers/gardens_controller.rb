class GardensController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:destroy]
  skip_before_action :verify_authenticity_token, :only => [:destroy]
  
  def show
    @plants = current_user.plants.order(name: :asc)
  end

  def create
    plant = Plant.find(params[:plant_id])
    if !current_user.plants.include?(plant)
      current_user.plants << plant
      flash[:info] = "#{plant.name} added to #{ActionController::Base.helpers.link_to 'garden', garden_path}!"
      redirect_to plant_path(plant)
    else
      flash[:alert] = "heyyy that's already in your #{ActionController::Base.helpers.link_to 'garden', garden_path}!"
      redirect_to plant_path(plant)
    end
  end

  def destroy
    current_user = User.find(params[:user_id])
    plant = Plant.find(params[:plant_id])
    current_user.plants.delete(plant)
    render json: plant
  end
end
