Rails.application.routes.draw do
  devise_scope :user do
    # get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "users/sign_up" => "devise/registrations#index" # , as: "new_user_registration" # sign_up/registrationへのカスタムパス
    get "users/sign_up/registration" => "devise/registrations#new" # メールアドレスの会員情報入力画面
    get "users/sign_up/facebook" => "devise/registrations#new_facebook" # facebookの会員情報入力画面
    get "users/sign_up/google" => "devise/registrations#new_google" # googleによる会員情報入力画面
    get "users/sign_up/sms_confirmation" => "devise/registrations#sms_confirmation" # 電話番号認証ページ
  end
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :show, :edit, :update] do
    resources :deals, only: [:new, :create]
  end
  resources :item_registration_forms, only: [:new, :create]
  get 'users' => 'users#show'
end
