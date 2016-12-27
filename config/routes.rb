Rails.application.routes.draw do
  
  # Overriding registrations controller (to set up single user system for devise)
  devise_for :users, controllers: { registrations: "my_registrations"}
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/about', to: 'static_pages#about'
  root to: "static_pages#home"
  
end
