class Users::TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was successfully created."
    else
      render :new
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
