Rails.application.routes.draw do
  resources :sales, format: 'json'
  resources :stocks, except: [:create, :destroy], format: 'json'
  resources :products, format: 'json'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'authenticate', to: 'authentication#authenticate', format: 'json' 
  post 'register', to: 'users#create', format: 'json'
  match '*unmatched', via: [:options], to: 'application#xhr_options_request'
end
