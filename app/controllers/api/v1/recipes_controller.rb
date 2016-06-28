module Api
  module V1
    class RecipesController < ApiController
      def index
        respond_with Recipe.all(params[:plant])
      end
    end
  end
end
