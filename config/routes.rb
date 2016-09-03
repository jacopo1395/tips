Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/profile', to: 'static_pages#profile'

  devise_scope :user do get "/sign_in/retry" => "users/sessions#retry" end
  devise_scope :user do get "/sign_up/retry" => "users/registrations#retry" end


  #devise_scope :user do  delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session end

  get '/new_admin', to: 'admins#new_admin'

  post '/create_admin', to: 'admins#create_admin'

  get '/admin', to: 'admins#admin'  #da cancellare!! Ti fa diventare admin, è solo per test.

  get '/search', to: 'searches#new'

end
