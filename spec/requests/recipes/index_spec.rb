require 'rails_helper'

RSpec.describe 'the recipe index API response (api/vi/recipes?country={query})', type: :request  do
  context 'happy paths' do
    it 'returns a json response with an array of recipe objects' do

      country = "spain"

      get "/api/v1/recipes?country=#{country}"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to be_a Array
    end

    it 'the response contains the correct attributes for each recipe' do 

    end

  end

  context 'sad paths' do
    describe 'when an incorrect key is used' do

    end
    describe 'when no recipes are returned' do

    end
  end
end