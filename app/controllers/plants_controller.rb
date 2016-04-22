class PlantsController < ApplicationController
  respond_to :html, :json

  def index
    term = params[:term].try(:downcase)
    @plants = Plant.where("LOWER(name) LIKE ?", "%#{term}%")
    respond_with(@plants)
  end
end
