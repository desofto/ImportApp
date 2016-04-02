Rails.application.routes.draw do
  resources :operations, only: [] do
    collection do
      post :import
    end
  end

  resources :companies, only: [] do
    resources :operations, only: [:index]
  end

  get :stats, to: 'companies#stats'

  root to: 'companies#index', as: :root
end
