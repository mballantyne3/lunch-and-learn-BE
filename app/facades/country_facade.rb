class CountryFacade

  def self.randomize_country
    CountryService.get_all_countries.sample[:name][:common]
  end
end
