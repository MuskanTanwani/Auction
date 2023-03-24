Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root 'home#index'
  get 'product/id'
  resources :products 
  get 'bids/:id', to: 'bids#index', as: 'bid'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
