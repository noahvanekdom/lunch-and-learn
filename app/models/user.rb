require 'securerandom'

class User < ApplicationRecord
  validates_presence_of :name
  validates :email, uniqueness: true, presence: true


  def add_api_key
    new_api_key = SecureRandom.hex(20)

    update(api_key: new_api_key)
  end
end
