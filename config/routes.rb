Rails.application.routes.draw do
  root "home#index"
  resources :shops, only: %i[index show] do
    resources :menu_items, only: %i[index show] do
      post "add_cart" => "carts#add"
    end
    resource :cart, only: %i[show]
  end
  resources :carts, only: %i[index]
end
