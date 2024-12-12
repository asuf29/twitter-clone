class Tweets::CommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    comment = @tweet.comments.new(comment_params)
    if comment.save 
      redirect_to tweet_path(@tweet)
    end
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to tweet_path(@tweet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to tweet_path(@tweet), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end