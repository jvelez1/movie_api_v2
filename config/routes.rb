Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }, controllers: { sessions: 'sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: :index
  resources :seasons, only: :index
  resources :video_footages, only: :index
  resources :purchases, only: :create
  get '/libraries', to: 'libraries#index'
end
