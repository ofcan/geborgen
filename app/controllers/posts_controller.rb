class PostsController < ApplicationController
  
  def index
    @title = 'Posts'
    @posts = Post.all
  end
  
end
