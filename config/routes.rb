Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:create, :index, :show, :edit]
  resources :users, only: [:edit, :update, :index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
end
