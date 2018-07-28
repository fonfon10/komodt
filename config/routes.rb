Rails.application.routes.draw do
  resources :sale_types
  resources :price_entries
  resources :distributors
  resources :sub_categories
  resources :packages
  resources :units
  resources :categories
  resources :products
  resources :suppliers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
