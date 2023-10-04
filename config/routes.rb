# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboards', to: 'dashboards#index'
  devise_for :users
  root 'home#index'
  resources :boards, only: %i[new create]
end
