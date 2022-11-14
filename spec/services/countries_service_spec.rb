require 'rails_helper'

RSpec.describe 'country service API consumption' do

  describe 'all countries endpoint' do
    it 'returns an array of hashes that include the name of the country', :vcr do
      country_array = CountriesService.all

      ##add stuff here
    end
  end

  describe 'details for a country' do
    it 'returns the details for a single country by search term', :vcr do
      country = "peru"
      country_details = CountriesService.details(country)
    end
  end
end