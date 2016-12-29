class PostsController < ApplicationController
  
  before_action :check_current_user, only: [:new, :create]
  
  def index
    @title = 'Posts'
    @posts = Post.all
  end
  
  def new
    @title = 'New post'
    @post = current_user.posts.build
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to @post
    else
      flash[:error] = "Post not created."
      render 'static_pages/home'
    end
  end
  
  def show
    @title = 'title'
    @post = Post.find(params[:id])
  end
  
    private
  
    def check_current_user
      redirect_to new_user_session_path unless current_user
    end
  
    def post_params
      params.require(:post).permit(:content)
    end
  
end
