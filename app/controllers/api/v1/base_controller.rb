module Api
  module V1
    class BaseController < ApplicationController
      include Api::Errors
      before_action :login_required

      private

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end

      def login_required
        render json: {message: "Unauthorized", status: 401} unless current_user
      end
    end
  end
end