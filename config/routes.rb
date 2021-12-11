# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'currencies#index'
  resources :currencies, only: %i[index show], param: :char_code do
    collection do
      post :update_rates
    end
  end
end
