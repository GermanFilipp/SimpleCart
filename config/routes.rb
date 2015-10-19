SimpleCart::Engine.routes.draw do

  resource :cart, only: [:show,:update,:destroy]

  resources :cart_items, only: [:create, :destroy]

end
