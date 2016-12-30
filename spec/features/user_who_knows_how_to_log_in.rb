require 'rails_helper'

RSpec.feature "navigation" do
  
  background do
    @user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    sign_in @user
  end
  
  it 'should create new post' do
    visit new_post_path
    fill_in('post_content', :with => 'Lorem ipsum.')
    click_button 'Create post'
    expect(page).to have_current_path post_path(Post.last)
  end
  
  it 'should be able to edit posts' do
    post = @user.posts.create(content: "Lorem ipsum.")
    visit edit_post_path(post)
    fill_in('post_content', :with => 'Edited lorem ipsum.')
    click_button 'Update post'
    expect(page).to have_current_path post_path(post)
    post.reload
    expect(post.content).to eq('Edited lorem ipsum.')
  end
  
end