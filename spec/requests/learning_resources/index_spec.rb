require 'rails_helper'

RSpec.describe 'the learning resources API endpoint (api/v1/learning_resources)' do
  describe 'happy path' do

    it 'returns json containing an array of different resources', :vcr do
      country = "belgium"
      get "/api/v1/learning_resources?country=#{country}"



      json = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(json).to be_an Hash

      data = json[:data]
      expect(data).to have_key(:id)
      expect(data[:id]).to eq("null")
      expect(data).to have_key(:type)
      expect(data[:type]).to eq("learning_resource")
      expect(data).to have_key(:attributes)
      expect(data[:attributes]).to be_an Hash

      attributes = data[:attributes]
      expect(attributes).to have_key(:country)
      expect(attributes[:country]).to eq(country)
      expect(attributes).to have_key(:video)
      expect(attributes[:video]).to be_a Hash
      expect(attributes[:video]).to have_key(:youtube_video_id)
      expect(attributes[:video][:youtube_video_id]).to be_a String
      expect(attributes[:video]).to have_key(:title)
      expect(attributes[:video][:title]).to be_a String
      expect(attributes[:video]).to_not have_key(:items)
      expect(attributes[:video]).to_not have_key(:kind)
      expect(attributes[:video]).to_not have_key(:published_at)



      expect(attributes).to have_key(:images)
      expect(attributes[:images]).to be_a Array

      image_data = attributes[:images].first

      expect(image_data).to have_key(:alt_tag)
      expect(image_data[:alt_tag]).to be_a String
      expect(image_data).to have_key(:url)
      expect(image_data[:url]).to be_a String
      expect(image_data).to_not have_key(:id)
      expect(image_data).to_not have_key(:color)
      expect(image_data).to_not have_key(:width)
      expect(image_data).to_not have_key(:id)
    end

    it 'will return information on a random country if no country is selected', :vcr do

      allow(CountriesFacade).to receive(:random).and_return('Morocco')
      get "/api/v1/learning_resources"
      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)


    end
  end
end
