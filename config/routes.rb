Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: "admins/sessions" }, skip: [:registrations, :passwords]
  resources :currencies, only: [:index, :show]
  resources :sites, only: [:index, :new, :show, :create, :destroy]
  resources :currency_sites, only: [:new, :create, :destroy]
  root to: 'currencies#index'
end
