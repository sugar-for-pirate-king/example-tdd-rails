# frozen_string_literal: true

module Web
  class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success_message] = 'Registration has been succeed'
        redirect_to new_user_path
      else
        flash.now[:error_message] = @user.errors.full_messages.join(', ')
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:full_name, :email, :password)
    end
  end
end
