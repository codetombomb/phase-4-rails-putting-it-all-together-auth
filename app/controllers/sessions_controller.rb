class SessionsController < ApplicationController
  # '/login'
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :created
    else
      render json: { errors: ["Invalid credentials"] }, status: :unauthorized
    end
  end


  def destroy
    # session.delete(:user_id)
    session[:user_id] = nil
  end
end
