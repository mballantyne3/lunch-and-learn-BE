class RecipeService
  def self.conn
    Faraday.new('https://api.edamam.com') do |f|
      f.params['app_key'] = ENV.fetch('app_key', nil)
      f.params['app_id'] = ENV.fetch('app_id', nil)
      f.params['type'] = 'public'
    end
  end

  def self.recipes(country)
    response = conn.get('/api/recipes/v2', q: country)
    JSON.parse(response.body, symbolize_names: true)
  end
end
