module Api
  module V1
    class PlantsController < ApiController
      before_filter :restrict_access
      def index
        respond_with Plant.all
      end

      def show
        respond_with Plant.find(params[:id])
      end

      private

        def method_name
          api_key = ApiKey.find_by(api_key: params[:api_key])
          head :unauthorized unless api_key
        end
    end
  end
end
