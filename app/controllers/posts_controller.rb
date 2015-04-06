class PostsController < ApplicationController
  def index
    @posts = reddit.front_page(options).results
    @first_id = @posts.first.id
    @last_id = @posts.last.id
  end

  def subreddit
    @posts = reddit.links(params[:subreddit], options)
    render 'index'
  end

  private

  def options
    {category: params[:category],
     time: params[:time],
     after: params[:after],
     before: params[:before]}
  end
end
