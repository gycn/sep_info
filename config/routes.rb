Rails.application.routes.draw do
  devise_for :users
  resources :users

  devise_scope :user do
    authenticated :user do
      root :to => 'visitors#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
