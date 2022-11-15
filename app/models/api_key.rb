class ApiKey

  def self.generator
    SecureRandom.base58(27)
  end
end
