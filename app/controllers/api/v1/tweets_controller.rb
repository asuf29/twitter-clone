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

  def show
    tweet = Tweet.includes(:comments).find(params[:id])

    render json: {
      tweet: {
        id: tweet.id,
        body: tweet.body,
        created_at: tweet.created_at,
        updated_at: tweet.updated_at
      },
      comments: tweet.comments.map do |comment| 
        {
          id: comment.id,
          body: comment.body,
          created_at: comment.created_at,
          updated_at: comment.updated_at
        }
      end
    }
  rescue
    render json: {error: "Tweet not found"}, status: :not_found
  end
end