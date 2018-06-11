Rails.application.routes.draw do
  get 'static_pages/index'
  resources :predictions
  root 'predictions#new'
end
