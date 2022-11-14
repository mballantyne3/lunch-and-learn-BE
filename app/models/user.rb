class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email, uniqueness: true
  validates_presence_of :api_key, allow_nil: true, uniqueness: true

  def set_api_key
    self.api_key = ApiKey.generator
  end
end
