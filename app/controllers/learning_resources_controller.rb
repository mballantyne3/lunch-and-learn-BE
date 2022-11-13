class LearningResourcesController < ApplicationController

  def show
    learning_resources = LearningResourceFacade.learning_resources(params[:country])
    render json: {data: learning_resources}
  end
end
