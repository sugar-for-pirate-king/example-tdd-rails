# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def require_login
    redirect_to new_login_path if session[:user_id].blank?
  end
end
