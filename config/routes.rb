Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root 'home#index'
  get 'product/id'
  get '/products/won'    ,to: 'bids#won', as: 'won_bids'
  
  get '/purchased/products', to: 'bids#purchased_items', as: 'purchased'
  resources :products 

  # get 'something', to: 'controller#action', as: 'something'

  put 'bids/:id/accept' , to: 'bids#accept', as: 'accept_bid'

  put 'bids/:id', to: 'bids#bid_accept_by_buyer', as: 'purchase_item'

  get 'bids', to: 'bids#show', as: 'user_bids'


  get '/products/:product_id/bids' , to: 'bids#index', as: 'product_bids'
  
  get '/products/:product_id/bids/new', to: 'bids#new', as: 'new_product_bid'

  post '/products/:product_id/bids', to: 'bids#create', as: 'create_bid'

  get '/products/:product_id/bids/:id/edit', to: 'bids#edit', as: 'edit_bid'

  patch '/products/:product_id/bids/:id', to: 'bids#update', as: 'update_bid'

  delete '/products/:product_id/bids/:id', to: 'bids#destroy', as: 'destroy_bid'

  get '/sold/products', to: 'bids#sold_items', as: 'sold_item'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
