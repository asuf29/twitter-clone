class Tweets::CommentsController < ApplicationController
  before_action :set_tweet, only: [:create, :edit, :update, :destroy]
  
  def create
    comment = @tweet.comments.new(comment_params)
    if comment.save 
      redirect_to tweet_path(@tweet)
    end
  end

  def edit
    @comment = @tweet.comments.find(params[:id])
  end

  def update
    @comment = @tweet.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
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
end