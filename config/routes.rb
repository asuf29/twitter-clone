Rails.application.routes.draw do
  root "tweets#index"

  #tweets controllerını tanımladık
  resources :tweets do
    resources :comments, controller: "tweets/comments"
  end
  resources :users do
    resources :tweets, controller: "users/tweets"
  end

end
