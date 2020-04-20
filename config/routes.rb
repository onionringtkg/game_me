Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :shops, only: %i[index show] do
    resources :menu_items, only: %i[index show] do
      post "add_cart" => "cart_items#create"
    end
    resource :cart, only: %i[show] do
      resources :cart_items, only: %i[update destroy]
    end
    resource :order, controller: :orders, only: %i[new create] do
      post "pay"
    end
  end
  resources :carts, only: %i[index]
  resources :orders, only: %i[index]
end
