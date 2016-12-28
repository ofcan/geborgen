require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  
  it 'should navigate to about page properly' do
    get :about
    assert_template 'static_pages/about'
  end

end
