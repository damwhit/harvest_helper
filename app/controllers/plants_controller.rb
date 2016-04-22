class PlantsController < ApplicationController
  respond_to :html, :json

  def index
    term = params[:term].try(:downcase)
    plants = Plant.where("LOWER(name) LIKE ?", "%#{term}%").take(20)
    respond_with(plants)
  end

  def show
    @plant = Plant.find(params["id"])
  end

  def create
    plant = Plant.find_by("LOWER(name) LIKE ?", "%#{params[:search]}%")
    redirect_to plant_path(plant)
  end
end
