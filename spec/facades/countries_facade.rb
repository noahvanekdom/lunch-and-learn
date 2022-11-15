require 'rails_helper' 

RSpec.describe 'Countries facade' do
  describe 'lat_long' do
    it 'can return the assigned latitude and longitude for a particular country search', :vcr do
      country = "peru"


      country_coordinates = CountriesFacade.lat_long(country)

      expect(country_coordinates).to be_a Array
    end
  end
end