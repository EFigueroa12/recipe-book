Rails.application.routes.draw do
  
  devise_for :users
  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  authenticated :user do
    root to: 'recipes#index', as: :authenticated_root
  end

  resources :recipes
end
