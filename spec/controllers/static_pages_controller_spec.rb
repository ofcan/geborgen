require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  
  it 'should navigate to about page properly' do
    get :about
    assert_template 'static_pages/about'
  end
  
  it 'root should be home static page' do
    expect(:get => root_url).to route_to(
                                  :controller => "static_pages",
                                  :action => "home")
    get :home
    assert_template 'static_pages/home'
  end

end
