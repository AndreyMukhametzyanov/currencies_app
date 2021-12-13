# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  root to: 'currencies#index'
  resources :currencies, only: %i[index show], param: :char_code do
    collection do
      post :update_rates
    end
  end
end
