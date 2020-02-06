class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)

    if user.valid?
      render json: { user: user, token: issue_token({ user_id: user.id }) }
    else
      render json: { errors: user.errors.full_messages }, status: :not_acceptable
    end
  end
  
  def login
    user = User.find_by(email: user_params[:email])

    if !user
      render json: { errors: ["It seems that you haven't registed with us"] }, status: :not_found
      return
    end

    if user && user.authenticate(user_params[:password])
      render json: { token: issue_token({ user_id: user.id }) }
    else
      render json: { errors: ["unauthorized"] }, status: :unauthorized
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
    if !logged_in?
      protected_action()
      return
    end
    user = @current_user
    user.update(user_params)
    render json: { user: UserSerializer.new(user) }
  end

  def destroy
    if !logged_in?
      protected_action()
      return
    end

    user = User.find_by(id: params[:id])
    return user.destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :avatar, :bio, :password)
  end
end
