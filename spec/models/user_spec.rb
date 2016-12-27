require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'should enable creation of only one user' do
    user_1 = User.create(email: 'sven1@example.com', password: 'pass123', password_confirmation: 'pass123')
    user_2 = User.create(email: 'sven2@example.com', password: 'pass123', password_confirmation: 'pass123')
    expect(User.count).to eq(1)
  end
  
end
