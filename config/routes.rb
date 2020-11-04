Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: :index
  resources :seasons, only: :index
  resources :video_footages, only: :index
end
