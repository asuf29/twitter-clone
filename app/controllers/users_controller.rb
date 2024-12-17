class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    if params[:query].present? #.present ile kullanıcının bir arama sorgusu gönderip göndermediğini kontrol eder.
      query = "%#{params[:query]}%" #istekte gönderilen parametreleri alıyoruz
      @users = User.where("first_name ILIKE ? OR last_name ILIKE ? OR username ILIKE ?", query, query, query) 
    else
      @users = User.all
    end
  end

  def show
    @tweets = @user.tweets.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_picture, :email, :first_name, :last_name, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
