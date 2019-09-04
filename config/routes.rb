Rails.application.routes.draw do
  
  resources :games, only: [:index, :show, :new, :create] do
    resources :reviews
  end
  resources :users do
    resources :reviews, only: [:index]
  end
  resources :reviews

  root 'application#home'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get '/popular' => 'reviews#popular'
end
