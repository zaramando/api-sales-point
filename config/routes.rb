Rails.application.routes.draw do
  resources :sales
  resources :stocks, except: [:create, :destroy]
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate' 
  post 'register', to: 'users#create'
end
