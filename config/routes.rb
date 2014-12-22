Rails.application.routes.draw do

  root 'dashboard#index'

  resources :users do
    resources :quotes, only: [:create, :destroy]
  end

  get  '/signout',    to: 'authentication#destroy', as: :signout
  post '/signin',     to: 'authentication#create',  as: :signin

  post  '/quick_info', to: 'dashboard#quick_info',   as: :quickinfo
  get   '/dashboard/update_tweets', to: 'dashboard#update_tweets'
  get   '/dashboard/update_stock_twits', to: 'dashboard#update_stock_twits'
end
