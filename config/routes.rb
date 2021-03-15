Rails.application.routes.draw do
  root 'central#home'
  get '/about',  to: 'central#about'
  get '/search', to: 'central#search'
end
