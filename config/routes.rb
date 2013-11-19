Applift::Application.routes.draw do
  root to: 'gadgets#index'

  resources :gadgets
end
