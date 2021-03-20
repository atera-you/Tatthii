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
  resources :users
end
