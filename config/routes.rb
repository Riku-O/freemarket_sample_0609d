Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'items' => 'items#index'
  get 'users' => 'users#show'
end
