# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::Base
      def require_login
        return true if session[:user_id].present?

        render json: { error: "You're not authenticated" }
      end
    end
  end
end
