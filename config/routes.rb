Rails.application.routes.draw do

  # Resources
  resources :pois
  resources :searches

  # Home page
  root 'static_pages#home'

  # Home page. "/home" is equal to "/" in this case
  get '/home', to: 'static_pages#home'

  # Path to the user profile. Maybe should be updated to point at the profile page
  # created by Devise for users?
  get '/profile', to: 'static_pages#profile'

  # Start a new search
  get '/search', to: 'searches#search'

  # Admin-related pages
  get '/new_admin', to: 'admins#new_admin'
  post '/create_admin', to: 'admins#create_admin'

  # Points of interest related pages
  get '/nuovo', to: 'pois#nuovo'

  # Devise stuff
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_scope :user do get "/sign_in/retry" => "users/sessions#retry" end
  devise_scope :user do get "/sign_up/retry" => "users/registrations#retry" end
  # devise_scope :user do  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session end
  devise_scope :user do get "/recent_pois" => "users/recent_pois#getpois" end

end
