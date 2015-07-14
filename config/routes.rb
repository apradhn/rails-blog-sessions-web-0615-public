RailsBlog::Application.routes.draw do
  root "posts#index"
  
  get "signup" => "users#new"
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get"/logout" => "sessions#destroy"

  resources :users
  resources :tags
  resources :sessions
  
  resources :posts do 
    resources :comments
  end
  
end
