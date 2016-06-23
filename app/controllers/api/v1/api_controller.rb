module Api
  module V1
    class ApiController < ApplicationController
      protect_from_forgery with: :null_session
      before_filter :restrict_access
      respond_to :json

      private
        def restrict_access
          api_key = ApiKey.find_by(api_key: params[:api_key])
          head :unauthorized unless api_key
        end
    end
  end
end
