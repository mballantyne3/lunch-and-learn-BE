class TouristSightFacade


  def self.tourist_sights(country)
    TouristSightService.tourist_sights(country)[:features].map do |sight_data|
      TouristSightPoro.new(sight_data)
    end
  end
end
