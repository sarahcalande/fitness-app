Rails.application.routes.draw do
  root 'sessions#new'
  resources :muscles, only: [:index, :show]
  resources :user_fav_exercises, only: [:index]
  resources :exercises, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :new, :create, :destory, :update, :edit]
  resources :categories, only: [:index, :show]


  get '/signup', to: 'users#new'
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  post '/exercises/save_to_favs', to: 'user_fav_exercises#save_to_favs'
  post '/exercises/remove_from_favs', to: 'user_fav_exercises#remove_from_favs'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
