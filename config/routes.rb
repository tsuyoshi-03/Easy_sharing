Rails.application.routes.draw do
  get 'maps/index'
  root "pages#index"
  get 'sessions/new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/index'
  get 'pages/top'
  get 'pages/search'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
  resources :comments
  resources :shops
  resources :maps, only: [:index]
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post 'favorites/:topic_id/destroy' => "favorites#destroy"
  
end
