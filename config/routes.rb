Rails.application.routes.draw do

  # Resources
  resources :pois
  resources :searches

  # Home page
  root 'static_pages#home'

  # Home page. "/home" is equal to "/" in this case
  get '/home', to: 'static_pages#home'

  # Path to the user profile.
  get '/my_profile', to: 'static_pages#my_profile'
  get '/profile/:id', to: 'static_pages#profile', as: 'profile'

  # cercare altri utenti per username o email
  get "/find_users", to: 'static_pages#find_users'
  get "/find_users/results", to: 'static_pages#list_users'
  
  # cercare altri utenti per username o email
  get "/final_quest", to: 'questions#final_quest'
  get "/final_filter", to: 'questions#final_filter'

  # Start a new search
  get '/search', to: 'searches#search', as: 'new_tip'
  # Link to general_question
  get '/search/general_question', to: 'searches#general_question'
  # Link to final result
  get '/final_result/:id', to: 'questions#final_result', as: 'final_result'

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
