require 'rails_helper'

RSpec.feature "navigation" do
  
  background do
    @user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
    sign_in @user
  end
  
  it 'should create new post' do
    visit new_post_path
    fill_in('post_title', :with => 'Post title.')
    fill_in('post_content', :with => 'Lorem ipsum.')
    fill_in('post_video_link', :with => 'https://www.youtube.com/watch?v=r1OCWAbwML4&index=273&list=PL78wc8Lq8LNSs4yIDVQIMYb8nIqJ9Ecd4.')
    fill_in('post_subtitle', :with => 'Post subtitle.')
    click_button 'Create post'
    expect(page).to have_current_path post_path(Post.last)
  end
  
  it 'should be able to edit posts' do
    post = @user.posts.create(title: "Post title.")
    visit edit_post_path(post)
    fill_in('post_content', :with => 'Edited post content.')
    fill_in('post_video_link', :with => 'Edited post video link.')
    fill_in('post_subtitle', :with => 'Edited post subtitle.')
    click_button 'Update post'
    expect(page).to have_current_path post_path(post)
    post.reload
    expect(post.content).to eq('Edited post content.')
    expect(post.video_link).to eq('Edited post video link.')
    expect(post.subtitle).to eq('Edited post subtitle.')
  end
  
end
