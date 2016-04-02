Rails.application.routes.draw do
  resources :operations, only: [] do
    collection do
      post :import
    end
  end

  root to: 'operations#index', as: :root
end
