Rails.application.routes.draw do

resources :sites
resources :currencies
root to: 'sites#index'
end
