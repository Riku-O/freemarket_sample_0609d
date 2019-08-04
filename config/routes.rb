Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'items' => 'items#index'
  get 'items/new' => 'items#new'
  get 'mypage' => 'mypage#index'
end
