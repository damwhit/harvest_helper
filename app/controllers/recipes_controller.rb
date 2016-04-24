class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all(params[:recipe_search])
  end
end
