Rails.application.routes.draw do
  get 'ajax/:action', to: 'ajax#:action', :defaults => { :format => 'json' }
  get 'home/index'

  namespace :api do
    get '/user', to: '/api/user#data'
    get '/user/bids', to: '/api/user#user_bids'
    patch '/user/update', to: '/api/user#user_data_update'
  end

  devise_for :users
  root 'home#index'
  get 'product/id'
  get '/products/won'    ,to: 'bids#won', as: 'won_bids'

  
  get '/purchased/products', to: 'bids#purchased_items', as: 'purchased'
  resources :products 

  # get 'something', to: 'controller#action', as: 'something'

  get "rejected/bids", to: 'bids#rejected', as: 'rejected'

  post "cards/:id" => "checkout#create_card", as: :create_payment_method

  get 'bids/:id/payment', to: 'checkout#create', as: 'payment'

  put 'bids/:id/accept' , to: 'bids#accept', as: 'accept_bid'

  get 'bids/:id', to: 'bids#bid_accept_by_buyer', as: 'purchase_item'

  get 'bids', to: 'bids#show', as: 'user_bids'

  get 'history', to: 'payment#transaction', as: 'payment_history'


  get '/products/:product_id/bids' , to: 'bids#index', as: 'product_bids'
  
  get '/products/:product_id/bids/new', to: 'bids#new', as: 'new_product_bid'

  post '/products/:product_id/bids', to: 'bids#create', as: 'create_bid'

  get '/sold/products', to: 'bids#sold_items', as: 'sold_item'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
