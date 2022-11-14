require 'rails_helper'

RSpec.describe 'the learning resources API endpoint (api/v1/learning_resources)' do
  describe 'happy path' do

    it 'returns json containing an array of different resources' do
      country = "spain"
      get "/api/v1/learning_resources?country=#{country}"
    end
  end
end
