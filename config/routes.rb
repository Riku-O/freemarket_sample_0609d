Rails.application.routes.draw do
  devise_for :users
  get 'items' => 'items#index'
<<<<<<< HEAD
  get 'sells' => 'sells#show'

=======
  get 'mypage' => 'mypage#index'
>>>>>>> origin
end
