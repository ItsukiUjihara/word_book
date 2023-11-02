Rails.application.routes.draw do
  root "words#index"
  resources :users
  resources :words do
    resources :synonyms
  end
  get 'login', to: 'sessions#new' ,as:'new_sessions'
  post 'login', to: 'sessions#create' ,as:'create_sessions'
  get 'logout', to: 'sessions#destroy' ,as:'destroy_sessions'
end
