Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://reviews.rubyonrails.org/routing.html
   
  resources :games, only: [:index, :show, :new, :create] do
    resources :reviews
  end

  resources :users do
    resources :reviews
  end

  resources :reviews

  root 'application#home'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get '/popular' => 'reviews#popular'
  get '/avgrating' => 'games#avgrating'

  
  
end
