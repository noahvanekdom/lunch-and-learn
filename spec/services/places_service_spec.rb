require 'rails_helper'

RSpec.describe 'external geoapify endpoints' do

  describe 'when querying the geoapify endpoint through the places service' do
    it 'can establish a successful connection' do
    end

    it 'can return an unformatted list of tourist attractions within 20000 meters', :vcr do
      lat_long = CountriesFacade.lat_long("France")
      response = PlacesService.tourist_sights(lat_long)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:features]).to be_a Array

      tourist_sight = json[:features].first

      expect(tourist_sight).to have_key(:type)
      expect(tourist_sight[:type]).to eq "Feature"
      expect(tourist_sight).to have_key(:properties)

      properties = tourist_sight[:properties]

      expect(properties).to have_key(:name)
      expect(properties[:name]).to be_a String
      expect(properties).to have_key(:street)
      expect(properties[:street]).to be_a String
      expect(properties).to have_key(:city)
      expect(properties[:city]).to be_a String
      expect(properties).to have_key(:postcode)
      expect(properties[:postcode]).to be_a String
      expect(properties).to have_key(:country)
      expect(properties[:country]).to be_a String
      expect(properties).to have_key(:name)
      expect(properties[:name]).to be_a String
      expect(properties).to have_key(:name)
      expect(properties[:name]).to be_a String
      expect(properties).to have_key(:formatted)
      expect(properties[:formatted]).to be_a String
      expect(properties).to have_key(:place_id)
      expect(properties[:place_id]).to be_a String
    end
  end
end