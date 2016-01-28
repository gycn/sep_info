Rails.application.routes.draw do
  resources :group_interviews

  resources :coffee_chats

  resources :interviews

  devise_for :users
  resources :users
  resources :rush_applications

  devise_scope :user do
    authenticated :user do
      root :to => 'rush_applications#edit', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end


end
