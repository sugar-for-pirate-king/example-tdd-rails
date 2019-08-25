# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web/welcome#index'

  scope module: :web do
    resource :login, only: %i[new create destroy]
    resources :users, only: %i[new create]
    resources :notes, only: %i[index]
  end

  scope :api, module: :api do
    scope :v1, module: :v1 do
      resources :notes
    end
  end
end
