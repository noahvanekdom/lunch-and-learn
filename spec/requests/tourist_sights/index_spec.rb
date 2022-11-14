require 'rails_helper'

RSpec.describe 'tourism attractions endpoint' do
  describe 'when a front end request is made to the endpoint (api/v1/tourist_sights)' do
    describe 'with a valid search query' do
      it 'returns a list of tourist attractions within 20,000 meters of the capital city', :vcr do
        country = "France"
        get "/api/v1/tourist_sights?country=#{country}"

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end