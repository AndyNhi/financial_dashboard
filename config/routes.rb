Rails.application.routes.draw do

  root 'dashboard#index'

  resources :users do
    resources :twtickers, only: [:index, :new, :create, :edit, :destroy]
  end

  get '/sign-in-sign-up', to: 'users#sign_in_sign_up'
 post '/signin', to: 'authentication#create', as: :signin
  get '/signout', to: 'authentication#destroy', as: :signout

end
