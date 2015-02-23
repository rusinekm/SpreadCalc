Rails.application.routes.draw do

resources :sites
resources :currencies
root to: 'currencies#index'
end
