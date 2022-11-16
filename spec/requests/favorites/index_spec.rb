require 'rails_helper'

RSpec.describe "the favorite index API endpoint" do
  describe "When a get request is sent to (/api/v1/favorites)" do

    before(:each) do
      @user = User.create!(name: "Mr. Bean", email: "justalilbean@gmail.com")
      @user.add_api_key
      @headers = { 'CONTENT_TYPE': 'application/json' }

      5.times do
        create(:favorite, user_id: @user.id)
      end
    end

    describe "happy path" do

      it 'returns a json response including all favorites for the user' do
        get("/api/v1/favorites?api_key=#{@user.api_key}", headers: @headers)
        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)

        expect(json).to have_key(:data)
        expect(json[:data]).to be_a Array
        expect(json[:data].count).to eq 5
        favorite_data = json[:data].first
        expect(favorite_data).to be_an Hash
        expect(favorite_data).to have_key(:id)
        expect(favorite_data[:id]).to be_a String
        expect(favorite_data).to have_key(:type)
        expect(favorite_data[:type]).to eq("favorite")
        expect(favorite_data).to have_key(:attributes)
        expect(favorite_data[:attributes]).to be_an Hash

        attributes = favorite_data[:attributes]
        expect(attributes).to have_key(:recipe_title)
        expect(attributes[:recipe_title]).to be_an String
        expect(attributes).to have_key(:recipe_link)
        expect(attributes[:recipe_link]).to be_an String
        expect(attributes).to have_key(:country)
        expect(attributes[:country]).to be_an String
        expect(attributes).to have_key(:created_at)
        expect(attributes[:created_at]).to be_an String
      end
    end
  end
end