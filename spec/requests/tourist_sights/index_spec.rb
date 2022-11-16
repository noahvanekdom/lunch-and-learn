require 'rails_helper'

RSpec.describe 'tourism attractions endpoint' do
  describe 'when a front end request is made to the endpoint (api/v1/tourist_sights)' do
    describe 'happy path' do
      it 'returns a list of tourist attractions within 20,000 meters of the capital city of the queried country', :vcr do
        country = "France"
        get "/api/v1/tourist_sights?country=#{country}"

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)


        tourist_sights = json[:data]
        expect(tourist_sights).to be_a Array

        tourist_sight = tourist_sights.first

        expect(tourist_sight).to have_key(:id)
        expect(tourist_sight[:id]).to eq("null")
        expect(tourist_sight).to have_key(:type)
        expect(tourist_sight[:type]).to eq("tourist_sight")
        expect(tourist_sight).to have_key(:attributes)
        expect(tourist_sight[:attributes]).to be_a Hash

        attributes = tourist_sight[:attributes]
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a String
        expect(attributes).to have_key(:address)
        expect(attributes[:address]).to be_a String
        expect(attributes).to have_key(:place_id)
        expect(attributes[:place_id]).to be_a String

        expect(attributes).to_not have_key(:region)
        expect(attributes).to_not have_key(:details)
        expect(attributes).to_not have_key(:datasource)
      end

      it 'when no country query param is entered, it uses a random country', :vcr do
        allow(CountriesFacade).to receive(:random).and_return("France")

        get "/api/v1/tourist_sights"

        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)


        tourist_sights = json[:data]
        expect(tourist_sights).to be_a Array

        tourist_sight = tourist_sights.first

        expect(tourist_sight).to have_key(:id)
        expect(tourist_sight[:id]).to eq("null")
        expect(tourist_sight).to have_key(:type)
        expect(tourist_sight[:type]).to eq("tourist_sight")
        expect(tourist_sight).to have_key(:attributes)
        expect(tourist_sight[:attributes]).to be_a Hash

        attributes = tourist_sight[:attributes]
        expect(attributes).to have_key(:name)
        expect(attributes[:name]).to be_a String
        expect(attributes).to have_key(:address)
        expect(attributes[:address]).to be_a String
        expect(attributes).to have_key(:place_id)
        expect(attributes[:place_id]).to be_a String

        expect(attributes).to_not have_key(:region)
        expect(attributes).to_not have_key(:details)
        expect(attributes).to_not have_key(:datasource)
      end
    end

    describe 'sad path' do
      describe 'when no country matches the search paramater', :vcr do
        # it 'returns an empty array with an error code' do
        #   country = "eiwfwoeifjwe"

        #   get "/api/v1/tourist_sights?country=#{country}"

        #   expect(response.status).to eq(400)
        # end
      end
    end
  end
end