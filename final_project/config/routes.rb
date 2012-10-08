FinalProject::Application.routes.draw do
  resources :articles
  resources :products
  resources :categories
  
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => 'sessions#new'
  resources :users  
  get "log_in" => "sessions#new", :as => "log_in" 
  get "log_out" => "sessions#destroy", :as => "log_out"
  resources :sessions 

  namespace :admin do
    resources :categories
  end
  resources :comments
end
