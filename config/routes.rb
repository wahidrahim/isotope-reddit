Rails.application.routes.draw do

  root 'posts#index'

  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/r/:subreddit(/:category(/:time))', to: 'posts#subreddit', as: 'subreddit'
  get '/submissions/:user(/:sort(/:time))', to: 'posts#submissions', as: 'submissions'
  get '(/:category(/:time))', to: 'posts#index', as: 'posts'
end
