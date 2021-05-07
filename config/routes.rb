Rails.application.routes.draw do
  get 'maps/index'
  root "pages#index"
  get 'sessions/new'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/index'
  get 'pages/top'
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'topics/mypost'
  get 'search', to: 'topics#search'
  
  resources :users
  resources :topics do
    get '/autocomplete_topic_shop_name/:topic_shop_name', on: :collection, action: :autocomplete_topic_shop_name
  end
  resources :comments
  resources :shops
  resources :maps, only: [:index]
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  post 'favorites/:topic_id/destroy' => "favorites#destroy"
  
end
