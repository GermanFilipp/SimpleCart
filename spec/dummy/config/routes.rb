Rails.application.routes.draw do

  devise_for :users
  mount SimpleCart::Engine, at: '/simple_cart'

  root 'books#index'

  resources :books, only: [:index, :show]


end
