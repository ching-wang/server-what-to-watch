class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid?
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end

  def login
    user = User.find_by(username: user_params[:username])

    if user && user.authenticate(user_params[:password])
      render json: user
    else
      render json: { errors: ["error"] }, status: :not_acceptable
    end
  end

  def validate
    if logged_in?
      render json: @current_user
    else
      render json: { errors: ["error"] }, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
