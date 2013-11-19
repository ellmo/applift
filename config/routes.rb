Applift::Application.routes.draw do
  root to: 'home#index'

  get 'home/index', to: 'home#index'
end
