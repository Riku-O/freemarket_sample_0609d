Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :edit, :update] do
    resources :deals, only: [:new, :create]
  end
  resources :item_registration_forms, only: [:new, :create]
  get 'users' => 'users#show'
  resources :users, only: [:index, :show, :create, :edit, :update]
end
