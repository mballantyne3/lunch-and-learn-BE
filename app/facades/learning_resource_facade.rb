class LearningResourceFacade

  def self.learning_resources(country)
    LearningResourceService.learning_resources(country)[:items].map do |resource_data|
      LearningResourcePoro.new(resource_data)
    end
  end
end
