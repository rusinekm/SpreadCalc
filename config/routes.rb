Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: "admins/sessions" }, skip: [:registrations, :passwords]
  resources :currencies, only: [:index, :show]
  resources :sites, only: [:index, :show, :destroy]
  resources :currency_sites, only: [:new, :create, :destroy]
  root to: 'currencies#index'
end
