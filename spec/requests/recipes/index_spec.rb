require 'rails_helper'

RSpec.describe 'the recipe index API response (api/vi/recipes?country={query})', type: :request  do
  context 'happy paths' do
    it 'returns a json response with an array of recipe objects', :vcr do

      country = "spain"
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to be_a Array
      expect(json[:data].count).to eq 10

      data = json[:data].first
      expect(data).to have_key(:id)
      expect(data[:id]).to eq "null"
      expect(data).to have_key(:type)
      expect(data[:type]).to eq "recipe"
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_an Hash

      attributes = data[:attributes]

      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a String
      expect(attributes).to have_key(:url)
      expect(attributes[:url]).to be_a String
      expect(attributes).to have_key(:image)
      expect(attributes[:image]).to be_a String
    end

    it 'the response does not contain unnecessary attributes', :vcr do
      country = "egypt"
      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data].count).to eq 10
      recipe_data = json[:data].first
      attributes = recipe_data[:attributes]
      expect(attributes).to_not have_key(:smarklgsmork)
    end

  end

  context 'sad paths' do
    describe 'when an incorrect key is used' do

    end
    describe 'when no recipes are returned' do

    end
  end
end