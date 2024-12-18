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
end