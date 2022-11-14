class ApiKey
  def self.generator
    SecureRandom.base64(27)
  end
end
