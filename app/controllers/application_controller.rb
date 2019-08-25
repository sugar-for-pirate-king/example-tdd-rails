# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthenticationHelper

  def require_login
    redirect_to new_login_path if not_signed_in?
  end
end
