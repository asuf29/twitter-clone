class Users::TweetsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @tweet = @user.tweets.new(tweet_params)

    if @tweet.save
      redirect_to user_path(@user)
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end