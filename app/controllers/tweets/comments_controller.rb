class Tweets::CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    comment = @tweet.comments.new(comment_params)
    if comment.save 
      redirect_to tweet_path(@tweet)
    end
  end
  def update
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end