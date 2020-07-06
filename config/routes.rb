Rails.application.routes.draw do
  root 'top#index'
  get 'users/login' => 'users#login_form'
  post 'users/login' => 'users#login'
  post 'users/logout' => 'users#logout' #今のところはpathをgetにしているが、session付けたら変更
  resources :users
  resources :items
  get 'items/:id/saler_index' => 'items#saler_index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
