class TouristSightService

  def self.conn
    Faraday.new('https://api.geoapify.com') do |f|
      f.params['apiKey'] = ENV.fetch('geo_api_key')
    end
  end

  def self.tourist_sights(country)
    latitude = CountryFacade.capital_lat_long(country)[0]
    longitude = CountryFacade.capital_lat_long(country)[1]
    response = conn.get("/v2/places?filter=circle:#{longitude},#{latitude},20000&categories=tourism.sights")
    JSON.parse(response.body, symbolize_names: true)
  end
end

