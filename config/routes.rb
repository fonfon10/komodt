Rails.application.routes.draw do


  devise_for :users
  resources :sale_types
  resources :price_entries
  resources :distributors
  resources :sub_categories
  resources :packages
  resources :units
  resources :categories
  resources :products
  resources :suppliers


  root to: 'products#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
