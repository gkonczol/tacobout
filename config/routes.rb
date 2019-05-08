Rails.application.routes.draw do
  resources :ingredients
  resources :ratings
  resources :shells
  resources :shops
  resources :tacos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
