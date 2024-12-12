class TweetsController < ApplicationController
  #tweetleri listeler
  def index
    @tweets = Tweet.all
  end
  #tweet detay sayfası
  def show
    @tweet = Tweet.find(params[:id])
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
    @tweet = Tweet.find(params[:id])
  end
  #tweet güncelleme işlemi
  def update
    @tweet = Tweet.find(params[:id])

    if @tweet.update(tweet_params)
      redirect_to @tweet
    else 
      render :edit, status: :unprocessable_entity
    end
  end
  #tweet silme işlemi
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to root_path(@tweet), status: :see_other
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body, :user_id)
  end
end
