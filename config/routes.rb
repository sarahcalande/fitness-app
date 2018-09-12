Rails.application.routes.draw do
  root 'sessions#new'
  resources :muscles
  resources :user_fav_exercises
  resources :exercises
  resources :users
  resources :categories
  resources :exercise_categories
  resources :exercise_muscles


  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  # get '/sessions', to: 'users#index'
  # post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/exercises/save_to_favs', to: 'user_fav_exercises#save_to_favs'
  post '/exercises/remove_from_favs', to: 'user_fav_exercises#remove_from_favs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
