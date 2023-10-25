# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    get 'lists/index'
  end
  get 'dashboards', to: 'dashboards#index'
  devise_for :users
  root 'home#index'
  resources :boards, only: %i[new create edit update destroy show]

  namespace :api do
    resources :boards do
      resources :lists, only: :index, controller: 'lists'
    end
  end
end
