Rails.application.routes.draw do
  resources :reviews
  resources :users
  resources :ingredients
  resources :ratings
  resources :shells
  resources :shops
  resources :tacos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/:id/write' => "users#write"

  get 'pages/login' => "pages#login"
  post 'pages/login' => "pages#login"

  root to: 'pages#home'
end
