class GardensController < ApplicationController
  before_action :authenticate_user!
  
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
    plant = current_user.plants.find(params[:plant_id])
    current_user.plants.delete(params[:plant_id])
    flash[:alert] = "#{ActionController::Base.helpers.link_to plant.name, plant_path(plant)} removed from garden."
    redirect_to gardens_path
  end
end
