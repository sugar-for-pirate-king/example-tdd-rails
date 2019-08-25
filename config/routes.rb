# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web/welcome#index'

  scope :web, module: :web do
    resources :login, only: %i[new create]
    resources :users, only: %i[new create]
    resources :notes, only: %i[index]
  end

  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :notes
    end
  end
end
