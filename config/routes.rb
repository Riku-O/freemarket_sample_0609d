Rails.application.routes.draw do
  devise_scope :user do
    # get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "users/sign_up" => "devise/registrations#index" # , as: "new_user_registration" # sign_up/registrationへのカスタムパス
    get "users/sign_up/registration" => "devise/registrations#new" # メールアドレスの会員情報入力画面
    get "users/sign_up/facebook" => "devise/registrations#new_facebook" # facebookの会員情報入力画面
    get "users/sign_up/google" => "devise/registrations#new_google" # googleによる会員情報入力画面
  end
  devise_for :users
  get 'items' => 'items#index'
  get 'mypage' => 'mypage#index'
end
