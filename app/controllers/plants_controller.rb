class PlantsController < ApplicationController
  respond_to :html, :json

  def index
    term = params[:term].try(:downcase)
    plants = Plant.where("LOWER(name) LIKE ?", "%#{term}%").take(7)
    respond_with(plants)
  end

  def show
    @plant = Plant.find(params["id"])

    location = Location.where(address: params[:zip]).first_or_create if params[:zip]
    frostdate = FrostDate.find(location.latitude, location.longitude) if location
    respond_with(frostdate)
  end

  def create
    plant = Plant.find_by("LOWER(name) LIKE ?", "%#{params[:search]}%")
    if !plant.nil?
      redirect_to plant_path(plant)
    else
      flash.now[:alert] = "Sorry, couldn't find that plant.  Search again."
      render :index
    end
  end
end
