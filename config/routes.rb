Rails.application.routes.draw do
  get 'users/new'
  get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
 
  resources :games, only: [:index, :show, :new, :create] do
    resources :reviews
  end
  resources :users
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
end
