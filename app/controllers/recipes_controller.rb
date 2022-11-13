class RecipesController < ApplicationController
  def index
    recipes = RecipeFacade.recipes(params[:country])
    render json: { data: recipes }
  end
end
