Rails.application.routes.draw do
  resources :orders
  get 'orders/index'
  resources :orders
  resources :notifications

  post 'addFriend', to: "users#addFriend"
get 'search', to: "users#index_friends"
get 'acceptFriend/:id', to: "users#accept_friends"
get 'declineFriend/:id', to: "users#decline_friends"
get 'removeFriend/:id', to: "users#remove_friends"


get '/invitedfriend/:id', to: 'orders#invitedfriends', as: 'invitedfriends'
get '/joinedfriend/:id', to: 'orders#joinedfriends', as: 'joinedfriends'

mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
