class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      render json: { data: UserPoro.new(user) }, status: 201
    else
      render json: user.errors.messages, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :api_key)
  end
end
