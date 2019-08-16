Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resource :items, only: [:index, :show, :edit, :update]
  resource :item_register, only: [:new, :create]
  get 'mypage' => 'mypage#index'
end
