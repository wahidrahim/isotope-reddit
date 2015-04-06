class PostsController < ApplicationController
  def index
    @posts = reddit.front_page(options).results
  end

  def subreddit
    @posts = reddit.links(params[:subreddit], options).results
    render 'index'
  end

  def submissions
    @posts = reddit.user_content(params[:user],
                                 category: 'submitted',
                                 sort: params[:sort],
                                 t: params[:time],
                                 after: params[:after],
                                 before: params[:before]).results
    render 'index'
  end

  private

  def render(*args)
    begin
      @first_id = @posts.first.id
      @last_id = @posts.last.id
    rescue
    end
    super
  end

  def options
    {category: params[:category],
     time: params[:time],
     after: params[:after],
     before: params[:before]}
  end
end
