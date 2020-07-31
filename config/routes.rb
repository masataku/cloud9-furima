Rails.application.routes.draw do
  root 'top#index'
  get 'users/login' => 'users#login_form'
  post 'users/login' => 'users#login'
  post 'users/logout' => 'users#logout' #今のところはpathをgetにしているが、session付けたら変更
  resources :users do
    resources :likes
  end  
  resources :items do
    resources :likes
  end  
  get 'items/:id/saling_index' => 'items#saling_index'
  get 'items/:id/sold_index' => 'items#sold_index'
  get 'items/:id/buyed' => 'items#buyed'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
