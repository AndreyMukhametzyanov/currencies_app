Rails.application.routes.draw do
  resources :currencies, only: [:index, :show], param: :char_code do
    collection do
      post :load
      post :update_rates
    end
  end
end
