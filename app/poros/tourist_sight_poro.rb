class TouristSightPoro
  attr_reader :id, :type, :attributes

  def initialize(data)
    @id = nil
    @type = "tourist_sight"
    @attributes = {
      name: data[:properties][:name],
      address: data[:properties][:address_line2],
        place_id: data[:properties][:place_id]
    }
  end
end
