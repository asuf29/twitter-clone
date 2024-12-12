class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  #tweetleri listeler
  def index
    @tweets = Tweet.all
  end
  #tweet detay sayfası
  def show
    @comments = @tweet.comments 
  end
  #yeni tweet oluşturma sayfası
  def new
    @tweet = Tweet.new 
  end
  #yeni tweet oluşturma işlemi
  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "Tweet başarıyla oluşturuldu."
    else
      render :new, status: :unprocessable_entity
    end
  end
  #tweet düzenleme sayfası
  def edit
  end
  #tweet güncelleme işlemi
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else 
      render :edit, status: :unprocessable_entity
    end
  end
  #tweet silme işlemi
  def destroy
    @tweet.destroy
    redirect_to root_path(@tweet), status: :see_other
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end
  
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
