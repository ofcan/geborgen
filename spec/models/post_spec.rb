require 'rails_helper'

RSpec.describe Post, type: :model do
  
  it 'should respond to correct methods' do
    post = Post.new
    expect(post).to respond_to(:user)
    expect(post).to respond_to(:title)
    expect(post).to respond_to(:content)
    expect(post).to respond_to(:image)
  end
  
  it 'should not create a post without a user' do
    post = Post.new(title: 'post title')
    expect(post).to_not be_valid
  end
  
  it 'should not create a post without title' do
    user = User.create(email: 'sven@example.com', password: 'pass123', password_confirmation: 'pass123')
    post = Post.new(user_id: user.id)
    expect(post).to_not be_valid
  end
  
  it 'should build a post given valid params' do
    user = User.create(email: 'sven@example.com', password: 'pass123', password_confirmation: 'pass123')
    post = user.posts.build(title: 'post title')
    expect(post).to be_valid
  end
  
end
