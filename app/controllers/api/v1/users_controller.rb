class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false
 
  def index
    if params[:search].present?
      query = "%#{params[:search]}% "
      users = User.where("username ILIKE ?", query)
    else
      users = User.all
    end

    render json: users.select(:id, :username), status: :ok
  end

  def show
    user = User.find_by(id: params[:id])

    if user
      render json: {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        username: user.username
      }, status: :ok
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end
end