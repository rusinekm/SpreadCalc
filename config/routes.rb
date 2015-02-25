Rails.application.routes.draw do

resources :currencies, only: [:index, :show]
root to: 'currencies#index'
end
