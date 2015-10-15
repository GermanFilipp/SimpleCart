SimpleCart::Engine.routes.draw do
  resources :carts, only: [:show, :update] do
    delete 'destroy', on: collection
  end
  resources :cart_items, only: [:create,  :destroy]

end
