module  Api
  module V1
    class FrostDatesController < ApiController
      def index
        location = Location.where(address: params[:zip]).first_or_create if params[:zip]
        frostdates = FrostDate.find(location.latitude, location.longitude) if location
        respond_with(frostdates)
      end
    end
  end
end
