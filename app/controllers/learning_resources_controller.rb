class LearningResourcesController < ApplicationController

  def show
    videos = VideoFacade.videos(params[:country])
    images = ImageFacade.images(params[:country])

    render json: {
      data: {
        id: nil,
        type: "learning_resource",
        attributes: {
          country: params[:country],
          video: videos[0] || [],
          images: images,
        },
      },
    }
  end
end
