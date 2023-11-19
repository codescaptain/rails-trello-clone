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
      resources :lists, only: :index, controller: 'lists'
    end
  end
end
