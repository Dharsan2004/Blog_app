Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  get "/about" => "pages#about"

  resources :articles


  #for SignUp for User

  get "/signup" => "users#new"
  post "/signup" => "users#create"
  resources :users, except: [:new]


  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"



  resources :categories , except: [:destroy]

end
