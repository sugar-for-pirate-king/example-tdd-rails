# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthenticationHelper

  def require_login
    return true if signed_in?

    redirect_to new_login_path
  end
end
