Rails.application.routes.draw do
  get 'items' => 'items#index'
  get 'mypage' => 'mypage#index'
  get 'registration' => 'registration#index'
end
