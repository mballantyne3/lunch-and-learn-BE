class UserPoro
  attr_reader :id, :type, :attributes

  def initialize(data)
    @id = data[:id]
    @type = "user"
    @attributes = {
      name: data[:name],
      email: data[:email],
      api_key: data[:api_key]
    }
  end
end
