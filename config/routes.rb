Rails.application.routes.draw do
  root 'top#index'
  get 'users/login' => 'users#login_form'
  post 'users/login' => 'users#login'
  get 'users/logout' => 'users#logout' #今のところはpathをgetにしているが、session付けたら変更
  get 'users/:id/like_index' => 'users#like_index'
  get 'users/:id/saling_index' => 'users#saling_index'
  get 'users/:id/sold_index' => 'users#sold_index'
  resources :users do
    resources :likes
  end  
  resources :items do
    resources :likes, :comments, only: [:create, :destroy]
  end  
  
  
  get 'items/:id/buyed' => 'items#buyed'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
