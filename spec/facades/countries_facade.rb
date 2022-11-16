require 'rails_helper' 

RSpec.describe 'Countries facade' do
  describe 'lat_long' do
    it 'can return the assigned latitude and longitude for a particular country search', :vcr do
      country = "peru"


      country_coordinates = CountriesFacade.lat_long(country)

      expect(country_coordinates).to be_a Array
    end


    it 'can return a random country from the country array' do

      country = CountriesFacade.random
      expect(country).to be_a String
      expect(country.length).to be > 3
    end\
  end
end