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

end
