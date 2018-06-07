#------------------------------------------------------------------------------
# config/routes.rb
#------------------------------------------------------------------------------
Rails.application.routes.draw do

  # Define API routes
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      resources :cars
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #
  # I am using the scope to map all of the reactjs paths so that I can 
  # define the reactjs as beginning with /app/${path} and I can use the
  # wildcards:
  #
  #   get '*path;, to pages#home'
  #
  # This makes adding the wild card less dangerous if I am running an App and a
  # regular website. Also, I can type the link in the browser and the app is
  # routed correctly.
  #
  scope :app do
    root          to: 'pages#home'
    get '*path',  to: 'pages#home' 
  end
  
  devise_for  :users
  
  root        to: 'pages#home'
  
end
