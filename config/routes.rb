Rails.application.routes.draw do
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # login/sign_inへのカスタムパス
    get "users/sign_up", to: "devise/registrations#index" # , as: "new_user_registration" # sign_up/registrationへのカスタムパス
    get "users/sign_up/registration", to: "devise/registrations#new" # メールアドレスの会員情報入力画面
    get "users/sign_up/facebook", to: "devise/registrations#new_facebook" # facebookの会員情報入力画面
    get "users/sign_up/google", to: "devise/registrations#new_google" # googleによる会員情報入力画面
    get "users/sign_up/sms_confirmation", to: "devise/registrations#sms_confirmation" # 電話番号認証ページ
    get "users/sign_up/address", to: "devise/registrations#address" # 発送元・お届け先住所入力ページ
    get "users/sign_up/credit_card", to: "card#new" # 支払い方法入力ページ
    get "users/sign_up/done", to: "devise/registrations#done" # 会員登録完了ページ
  end
  devise_for :users
  root 'items#index'
  get 'users/log_out', to: 'users#destroy'
  resources :users, only: [:show] do
    resources :user_information, only: [:new, :create, :edit, :update]
  end
  resources :item_registration_forms, only: [:new, :create, :edit,]
  resources :items, only: [:index, :show, :edit, :update, :destroy, :search] do
    resources :deals, only: [:new, :create]
  end
  get 'deals/:id/done', to: 'deals#done'
  resources :deals, only: [:show] do
    resources :deal_messages, only: [:new, :create]
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
