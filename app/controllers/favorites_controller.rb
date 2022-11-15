class FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      favorite = user.favorites.create(favorite_params)
      if favorite.save
        render json: { success: 'Favorite added successfully' }, status: 201
      else
        render json: { status: "error", message: "Favorite could not be saved", errors: favorite.errors.full_messages }, status: 422
      end
    else
      render json: { status: "error", message: "Could not find user by that api_key" }, status: 404
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end
