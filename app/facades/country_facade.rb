class CountryFacade

  def self.randomize_country
    CountryService.get_all_countries[0]
  end
end
