class Tweets::CommentsController < ApplicationController
  before_action :set_tweet
  before_action :set_comment, only: [:edit, :update, :destroy]
  
  def create
    @comment = @tweet.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save 
      redirect_to tweet_path(@tweet), notice: "Comment added successfully."
    else
      redirect_to tweet_path(@tweet), alert: "Failed to add comment."
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to tweet_path(@tweet), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end

  def set_tweet 
    @tweet = Tweet.find(params[:tweet_id])
  end

  def set_comment
    @comment = @tweet.comments.find(params[:id])
  end
end