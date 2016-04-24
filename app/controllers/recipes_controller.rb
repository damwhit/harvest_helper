class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(params[:recipe_search])
  end

  def show
    @recipe = Recipe.find(params[:eid])
  end
end
