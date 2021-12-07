Rails.application.routes.draw do
  root to: 'currencies#index'
  resources :currencies, only: [:index, :show], param: :char_code do
    collection do
      post :load
      post :update_rates
    end
  end
end
