Applift::Application.routes.draw do
  devise_for :users

  root to: 'gadgets#index'

  resources :gadgets
end
