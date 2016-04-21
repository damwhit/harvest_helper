class PlantsController < ApplicationController
  def index
    @plants = Plant.all
  end
end
