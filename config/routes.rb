Rails.application.routes.draw do
  root "tweets#index"

  #tweets controllerını tanımladık
  resources :tweets do
    resources :comments, controller: "tweets/comments"
  end
  
  resources :users do
    resources :tweets, controller: "users/tweets"
  end

  namespace :api do
    namespace :v1 do
      resources :users
    end
  end
end
