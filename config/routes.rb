Rails.application.routes.draw do

  root 'posts#index'

  get '/r/:subreddit(/:category)', to: 'posts#subreddit', as: 'subreddit'
  get '/:category(/:time)', to: 'posts#index', as: 'front_page'
end
