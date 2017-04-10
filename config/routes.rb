Rails.application.routes.draw do
  root to: 'surveys#new'
  resources :surveys, only: [:new, :create, :edit, :update, :show]
end
