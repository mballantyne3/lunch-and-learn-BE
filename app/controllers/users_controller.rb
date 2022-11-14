class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      user.set_api_key
      render json: { message: 'User successfully created' }, status: 201
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :email, :api_key)
  end
end
