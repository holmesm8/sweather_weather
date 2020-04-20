class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.create(user_params)
    if user.save
      render json: UserSerializer.new(user), status: 201
    else
      render json: user.errors, status: 400
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
end
