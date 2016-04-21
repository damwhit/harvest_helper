module Api
  module V1
    class PlantsController < ApiController
      def index
        respond_with Plant.all
      end

      def show
        respond_with Plant.find(params[:id])
      end
    end
  end
end
