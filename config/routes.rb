Rails.application.routes.draw do
  resources :customers
  resources :device_categories, path: 'device-categories'
end
