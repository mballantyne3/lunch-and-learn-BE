class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :api_key, allow_nil: true
  validates_uniqueness_of :api_key

  has_many :favorites

  before_create :set_api_key

  def set_api_key
    self.api_key ||= ApiKey.generator
  end
end
