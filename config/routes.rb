Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
end
