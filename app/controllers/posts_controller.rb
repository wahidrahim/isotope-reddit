class PostsController < ApplicationController
  def index
    @posts = reddit.front_page(options)
  end

  def subreddit
    @posts = reddit.links(params[:subreddit], options)
    render 'index'
  end

  private

  def options
    {category: params[:category],
     time: params[:time],
     after: params[:after]}
  end
end
