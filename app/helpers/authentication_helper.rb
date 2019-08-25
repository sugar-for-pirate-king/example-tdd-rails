# frozen_string_literal: true

module AuthenticationHelper
  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def signed_in?
    return false if current_user.blank?

    true
  end

  def logout
    session[:user_id] = nil
  end
end
