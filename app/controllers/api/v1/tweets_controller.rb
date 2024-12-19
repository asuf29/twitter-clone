class Api::V1::TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
  
  def index
    user = User.find(params[:user_id])
    tweets = user.tweets
  
    render json: {
      user_id: user.id,
      tweets: tweets.as_json(only: [:id, :body, :created_at, :updated_at])
    } and return
  rescue ActiveRecord::RecordNotFound
    render json: { error: "User not found" }, status: :not_found
  end
end