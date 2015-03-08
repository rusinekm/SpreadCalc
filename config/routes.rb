Rails.application.routes.draw do

resources :currencies, only: [:index, :show]
resources :sites, only: [:index, :new, :create, :destroy]
resources :currency_sites, only: [:new, :create, :destroy]
root to: 'currencies#index'
end
