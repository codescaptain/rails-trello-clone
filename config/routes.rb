# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboards', to: 'dashboards#index'
  devise_for :users
  root 'home#index'

  resources :boards do
    resources :lists
  end

  namespace :api do
    devise_for :users,
               skip: [:registrations],
               controllers: {
                 sessions: 'api/users/sessions'
               }

    resources :boards do
      resources :lists, only: %i[index], controller: 'lists'
      resources :list_positions, only: %i[index update], controller: 'list_positions'
    end
  end
end
