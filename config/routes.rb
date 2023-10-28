Rails.application.routes.draw do
  root "home#index"
  resources :users
  get 'login', to: 'sessions#new' ,as:'new_sessions'
  post 'login', to: 'sessions#create' ,as:'create_sessions'
  delete 'logout', to: 'sessions#destroy' ,as:'destroy_sessions'
  
  
end
