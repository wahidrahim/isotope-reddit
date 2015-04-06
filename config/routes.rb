Rails.application.routes.draw do

  root 'posts#index'

  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/r/:subreddit(/:category(/:time))', to: 'posts#subreddit', as: 'subreddit'
  get '/:category(/:time)', to: 'posts#index'
end
