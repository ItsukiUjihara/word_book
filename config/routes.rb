Rails.application.routes.draw do
  
  resources :quizzes, only: [:show] do
    post 'submit_answer', on: :member
    get 'track_progress', on: :collection
    delete 'reset_progress', on: :collection
  end
  root "words#index"
  resources :users
  resources :words do
    resources :synonyms
  end
  get 'login', to: 'sessions#new' ,as:'new_sessions'
  post 'login', to: 'sessions#create' ,as:'create_sessions'
  get 'logout', to: 'sessions#destroy' ,as:'destroy_sessions'
end
