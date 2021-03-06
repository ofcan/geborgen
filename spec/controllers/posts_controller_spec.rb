require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  it 'should navigate to index page properly' do
    get :index
    assert_template 'posts/index'
  end
  
  it 'root should be index' do
    expect(:get => root_url).to route_to(:controller => "posts",
                                         :action => "index")
  end
  
  it 'should redirect to login page when no one is logged in' do
    get :new
    expect(response).to redirect_to(new_user_session_path)
  end
  
  it 'should enable getting to new post page if there is current user' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    sign_in user
    get :new
    expect(response).to be_successful
  end
  
  it 'should not create post when no one is logged in' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    before_count = Post.count
    post :create, params: { user_id: user.id, title: "post title" }
    after_count = Post.count
    expect(response).to redirect_to(new_user_session_path)
    expect(before_count).to eq(after_count)
  end
  
  it 'should  create post when user is logged in' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    sign_in user
    before_count = Post.count
    post :create, params: { post: { title: "post title" } }
    after_count = Post.count
    expect(response).to redirect_to(Post.last)
    expect(before_count).to eq(after_count - 1)
  end
  
  it 'should edit and update post' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    sign_in user
    post = user.posts.create(title: "post title")
    get :edit, params: { id: post.id }
    assert_template 'posts/edit'
    put :update, params: { id: post.id, post: {title: "updated post title" } }
    post.reload
    expect(post.title).to eq("updated post title")
  end
  
  it 'should be able to delete posts' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    sign_in user
    post = user.posts.create(title: "post title")
    expect{ 
      delete :destroy, params: { id: post.id }
    }.to change(Post, :count).by(-1)
    expect(response).to redirect_to(root_path)
  end
  
  it 'should not be able to delete posts if user is not signed in' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    post = user.posts.create(title: "post title")
    expect{ 
      delete :destroy, params: { id: post.id }
    }.to_not change(Post, :count)
  end
  
  it 'should extract youtube id properly' do
    user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    post = user.posts.create(title: "post title",
                             video_link: "https://www.youtube.com/watch?v=9bZkp7q19f0")
  end

end
