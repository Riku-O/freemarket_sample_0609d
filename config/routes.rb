Rails.application.routes.draw do
  devise_for :users
  get 'items' => 'items#index'
  get 'mypage' => 'mypage#index'
end
