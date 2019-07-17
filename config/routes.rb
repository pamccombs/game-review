Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
 
  resources :games, only: [:index, :show, :new, :create, :edit] do
    resources :reviews
  end

  resources :users do
    resources :reviews
  end

  resources :reviews

  get "/auth/:provider/callback" => "sessions#create"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'

  
  
end
