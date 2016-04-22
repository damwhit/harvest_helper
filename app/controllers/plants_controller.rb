class PlantsController < ApplicationController
  respond_to :html, :json

  def index
    term = params[:term].try(:downcase)
    @plants = Plant.where("LOWER(name) LIKE ?", "%#{term}%").take(20)
    respond_with(@plants)
  end

  def show
    @plant = Plant.find(params["id"])
  end
end
