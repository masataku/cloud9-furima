Rails.application.routes.draw do
  root 'top#index'
  get 'users/login' => 'users#login_form'
  post 'users/login' => 'users#login'
  get 'users/logout' => 'users#logout'
  get 'users/:id/user_page' => 'users#user_page'
  get 'users/:id/like_index' => 'users#like_index'
  get 'users/:id/saling_index' => 'users#saling_index'
  get 'users/:id/sold_index' => 'users#sold_index'
  get 'users/:id/buyed_index' => 'users#buyed_index'
  get 'users/:id/addressee' => 'users#addressee'
  get 'users/:id/password' => 'users#password'
  get 'users/:id/identity' => 'users#identity'
  resources :users 
  resources :items do
    resources :likes, :comments, only: [:create, :destroy]
  end  
  
  resources :notifications, only: [:index]
  
  get 'items/:id/buyed' => 'items#buyed'
  get 'items/:id/tradind' => 'items#tradind'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
