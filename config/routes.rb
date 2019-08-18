Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resource :items
  get 'mypage' => 'mypage#index'
  resource :registrations
end
