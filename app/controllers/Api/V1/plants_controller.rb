module Api
  module V1
    class PlantsController < ApiController
      def index
        respond_with Plant.all
      end
    end
  end
end
