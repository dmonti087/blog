Rails.application.routes.draw do
  resources :orders
  # get '/orders',  to:'orders#index', as:'orders'
  # post '/orders',  to:'orders#create'
  # get '/orders',  to:'orders#new', as:'new_order'
  # get 'orders/:id', to:'orders#show', as:'order'
  # get '/orders/:id/edit', to:'orders#edit', as:'edit_order'
  # patch '/orders/:id', to:'orders#update'
  # delete '/orders/:id', to:'orders#destroy'

  resources :customers

  resources :posts do
       resources :comments
end

  resources :pages
end
