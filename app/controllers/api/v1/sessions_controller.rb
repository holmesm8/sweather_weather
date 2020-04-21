class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session
  
  def create
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 200
    else
      render json: {error: 'Credentials Do Not Match'}, status: 400
    end
  end
end
