# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web/welcome#index'

  scope module: :web do
    resource :login, only: %i[new create destroy]
    resources :users, only: %i[new create]
    resources :notes, only: %i[index new]
  end

  namespace :api do
    namespace :v1 do
      resources :notes
    end
  end
end
