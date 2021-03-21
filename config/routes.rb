Rails.application.routes.draw do
  get 'sessions/new'
  root 'central#home'
  get '/about',  to: 'central#about'
  get '/search', to: 'central#search'
  get '/share',  to: 'users#share'
  get '/picture', to:'users#picture'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  #get '/form',   to:'microposts#new'
  #post '/share', to:'microposts#create'
  #delete '/delete', to:'microposts#destroy'
  resources :users
  resources :microposts, only:[:new,:create, :destroy]
end
