# frozen_string_literal: true

Rails.application.routes.draw do
  root 'web/welcome#index'

  scope :web do
    resource :login, only: %i[new]
    resources :users, only: %i[new]
  end
end
