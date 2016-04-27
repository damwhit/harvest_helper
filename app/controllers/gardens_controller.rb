class GardensController < ApplicationController

  def show
    @plants = current_user.plants
  end

  def create
    plant = Plant.find(params[:plant_id])
    if !current_user.plants.include?(plant)
      current_user.plants << plant
      flash[:info] = "#{plant.name} added to #{ActionController::Base.helpers.link_to 'garden', garden_path}!"
      redirect_to plant_path(plant)
    else
      flash[:alert] = "heyyy that's already in your garden!"
      redirect_to plant_path(plant)
    end
  end
end
