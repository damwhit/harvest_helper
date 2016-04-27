class GardensController < ApplicationController

  def show
    @plants = current_user.plants
  end

  def create
    plant = Plant.find(params[:plant_id])
    current_user.plants << plant
    flash[:info] = "#{plant.name} added to #{ActionController::Base.helpers.link_to 'garden', garden_path}!"
    redirect_to plant_path(plant)
  end
end
