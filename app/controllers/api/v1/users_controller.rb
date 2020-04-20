class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    user = User.create(user_params)
    if user.save
      binding.pry
      render json: UserSerializer.new(user)
    else
      "placeholder"
    end
  end

  private

    def user_params
      params.permit(:email, :password)
    end
end
