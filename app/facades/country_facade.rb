class CountryFacade

  def self.randomize_country
    CountryService.get_all_countries.sample[:name][:common]
  end

  def self.capital_lat_long(country)
    CountryService.get_country(country)[0][:capitalInfo][:latlng]
  end
end
