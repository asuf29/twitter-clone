Rails.application.routes.draw do
  root "tweets#index"

  #tweets controllerını tanımladık
  resources :tweets
  resources :users
end
