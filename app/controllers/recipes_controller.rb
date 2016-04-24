class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(params[:plant])
  end

  def show
    @recipe = Recipe.find(params[:eid])
  end
end
