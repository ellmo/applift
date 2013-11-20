Applift::Application.routes.draw do
  devise_for :users

  root to: 'gadgets#index'

  resources :gadgets do
    get :search, on: :collection
  end
end
