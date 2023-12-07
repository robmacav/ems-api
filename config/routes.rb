Rails.application.routes.draw do
  resources :customers
  resources :devices
  resources :device_categories, path: 'device-categories'
end
