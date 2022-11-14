class TouristSightsController < ApplicationController

  def index
    tourist_sights = TouristSightFacade.tourist_sights(params[:country])
    render json: { data:tourist_sights }
  end
end
