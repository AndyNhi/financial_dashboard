Rails.application.routes.draw do

  root 'dashboard#index'

  resources :users
  resources :twtickers

  get 'users/account/:id', to: 'users#user_account', as: :user_account

  get '/sign-in', to: 'authentication#new', as: :signin
 post '/sign-in', to: 'authentication#create'

  get '/sign-out', to: 'authentication#destroy', as: :signout

end
