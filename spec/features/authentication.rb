require 'rails_helper'

RSpec.feature "navigation" do
  
  it 'should register in user' do
    before_count = User.count
    visit new_user_registration_path
    fill_in('Email', :with => 'sven@example.com')
    fill_in('Password', :with => 'pass123')
    fill_in('Password confirmation', :with => 'pass123')
    click_button 'Sign up'
    expect(page).to have_current_path root_path
    after_count = User.count
    expect(after_count).to eq(before_count + 1)   
  end
  
  it 'should log the user in' do
    user = User.create(email: 'sven@example.com', password: 'pass123', password_confirmation: 'pass123')
    visit new_user_session_path
    fill_in('Email', :with => 'sven@example.com')
    fill_in('Password', :with => 'secret123')
    click_button 'Log in'
  end
  
  it 'shoud not be able to go to new register path if there is already one user' do
    user = User.create(email: 'sven@example.com', password: 'pass123', password_confirmation: 'pass123')
    visit new_user_registration_path
    expect(page).to have_current_path new_user_session_path
  end
  
end