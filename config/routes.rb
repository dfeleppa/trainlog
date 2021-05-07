Rails.application.routes.draw do
  root 'sessions#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index]
  resources :entries
  resources :sections
  resources :entries do
    resources :sections
  end

end
