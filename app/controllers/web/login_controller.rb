# frozen_string_literal: true

module Web
  class LoginController < ApplicationController
    def new
      @form = LoginForm.new
    end

    def create
      user = User.find_by(email: form_params[:email])
      if user&.authenticate(form_params[:password])
        sign_in(user)
        redirect_to notes_path
      else
        flash.now[:error] = 'Email or password was invalid'
        render :new
      end
    end

    private

    def form_params
      params.require(:login_form).permit(:email, :password)
    end
  end
end
