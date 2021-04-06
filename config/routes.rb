Rails.application.routes.draw do
  root 'microposts#index'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users, only:[:new, :create, :show, :edit, :update, :destroy] do
    member do
      get :following
      get :followers
      get :favorite
    end
  end
  resources :microposts, only:[:new, :index,:create, :destroy] do
    collection do
      get :finder
    end
  end

  resources :relationships, only:[:create,:destroy]
end
