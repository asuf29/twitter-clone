Rails.application.routes.draw do
  root "tweets#index"

  #tweets controllerını tanımladık
  resources :tweets do
    resources :comments
  end
  resources :users 

end
