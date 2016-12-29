require 'rails_helper'

RSpec.feature "navigation" do
  
  background do
    @user = User.create(email: 'user@example.com', password: 'pass123', password_confirmation: 'pass123')
  end
  
  it 'should create new post' do
    sign_in @user
    visit new_post_path
    fill_in('post_content', :with => 'Lorem ipsum.')
    click_button 'Create post'
    expect(page).to have_current_path post_path(Post.last)
  end
  
end