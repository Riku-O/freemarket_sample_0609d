Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :edit, :update] do
    resources :deals, only: [:new, :create]
  end
  resources :item_registration_forms, only: [:new, :create]
  get 'users' => 'users#show'


  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
