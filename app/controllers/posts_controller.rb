class PostsController < ApplicationController
  
  before_action :check_current_user, except: [:index, :show]
  
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
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post updated"
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post successfuly deleted."
    redirect_to root_path
  end
  
    private
  
    def check_current_user
      redirect_to new_user_session_path unless current_user
    end
  
    def post_params
      params.require(:post).permit(:content)
    end
  
end