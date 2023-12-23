Rails.application.routes.draw do
  devise_for :users , controllers: {
    registrations: 'users/registrations'
  }
  get 'cart/show'
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  # namespace :admin do
  #   resources :products, only: [:index, :update, :create, :destroy, :edit, :new]
  # end
  resources :products
  # , only: [:index, :show, :new]
  root 'products#index'


end
