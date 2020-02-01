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
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      render json: { token: issue_token({ user_id: user.id }) }
    else
      render json: { errors: ["error"] }, status: :not_acceptable
    end
  end

  def validate
    if logged_in?
      render json: { user: UserSerializer.new(@current_user) }
    else
      render json: { errors: ["error"] }, status: :not_acceptable
    end
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(
      username: params[:username],
      email: params[:email],
    )
    render json: { user: UserSerializer.new(user) }
  end

  # headers['Last-Modified'] = Time.now.httpdate

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
