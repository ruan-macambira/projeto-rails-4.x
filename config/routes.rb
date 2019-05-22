Rails.application.routes.draw do
  resources :addresses
  get 'home' => 'home#index'
  root 'home#index'
  resources :phones
  resources :adresses
  resources :contacts
  resources :kinds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
