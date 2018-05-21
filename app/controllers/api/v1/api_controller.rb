module Api
  module V1
    class ApiController < ApplicationController
      protect_from_forgery with: :null_session
      before_action :restrict_access
      respond_to :json

      private
        def restrict_access
          head :unauthorized unless ApiKey.exists?(api_key: params[:api_key])
        end
    end
  end
end
