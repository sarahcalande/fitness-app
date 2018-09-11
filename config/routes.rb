Rails.application.routes.draw do
  resources :muscles
  resources :user_fav_exercises
  resources :exercises
  resources :users
  resources :categories
  resources :exercise_categories
  resources :exercise_muscles

  get '/signup', to: 'users#new'
  post '/login', to: 'users#show'
  get '/login', to: 'sessions#new'
  get '/sessions', to: 'users#index'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
