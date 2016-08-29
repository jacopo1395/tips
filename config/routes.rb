Rails.application.routes.draw do

  devise_for :users, controllers: {  sessions: 'users/sessions' }

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'

  get '/profile', to: 'static_pages#profile'
  

end
