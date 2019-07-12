Rails.application.routes.draw do
  get 'items' => 'items#index'
  get 'sells' => 'sells#show'

end
