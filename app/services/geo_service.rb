class GeoService

  def self.conn
    Faraday.new('https://api.geoapify.com/v2/places?PARAMS') do |f|
      f.params['apiKey'] = ENV.fetch['geo_api_key']
    end
  end
end
