Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"

  #tweets controllerını tanımladık
  resources :tweets do
    resources :comments, controller: "tweets/comments"
  end
  
  resources :users, except: [:destroy] do
    resources :tweets, controller: "users/tweets"
  end

  namespace :api do
    namespace :v1 do
      resources :users
      resources :tweets
    end
  end
end
