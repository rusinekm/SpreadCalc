Rails.application.routes.draw do

resources :sites
root to: 'sites#index'
end
