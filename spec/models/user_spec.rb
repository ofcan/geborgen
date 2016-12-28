require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'should respond to correct methods' do
    user = User.new
    expect(user).to respond_to(:posts)
  end
  
  it 'should enable creation of only one user' do
    user_1 = User.create(email: 'sven1@example.com', password: 'pass123', password_confirmation: 'pass123')
    before_count = User.count
    user_2 = User.create(email: 'sven2@example.com', password: 'pass123', password_confirmation: 'pass123')
    after_count = User.count
    expect(before_count).to eq(after_count)
  end
  
end
