Rails.application.routes.draw do

  root 'dashboard#index'

  resources :users
  resources :twtickers

  get '/sign-in-sign-up', to: 'users#sign_in_sign_up'
 post '/signin', to: 'authentication#create', as: :signin
  get '/signout', to: 'authentication#destroy', as: :signout

  get 'users/account/:id', to: 'users#user_account', as: :userprofile

end
