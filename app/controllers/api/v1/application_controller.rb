# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::Base
      include AuthenticationHelper

      def require_login
        return true if signed_in?

        render json: { error: "You're not authenticated" }
      end
    end
  end
end
