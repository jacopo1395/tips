Rails.application.routes.draw do

  get 'admins/index'

  devise_for :users#, controllers: {  sessions: 'users/sessions' }

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/profile', to: 'static_pages#profile'
  
  devise_scope :user do get "/retry" => "users/sessions#retry" end
  
  get '/new_admin', to: 'admins#new_admin'

  post '/create_admin', to: 'admins#create_admin'
  
  get '/admin', to: 'admins#admin'  #da cancellare!! Ti fa diventare admin, è solo per test.
  
  resources :admins
  
  
  

end
