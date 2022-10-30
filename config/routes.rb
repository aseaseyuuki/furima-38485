Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :items, only: [:new, :create, :index, :show, :edit, :update]
  
end
