require 'rails_helper'

RSpec.describe 'the create favorite API endpoint' do
  describe "happy path" do
    describe "when a post request is sent to (api/v1/favorites)" do
      before(:each) do
        @user = User.create!(name: "Mr. Bean", email: "justalilbean@gmail.com")
        @user.add_api_key

        @headers = { 'CONTENT_TYPE': 'application/json', 'Accept': 'application/json' }
        @body = {
          "api_key": "#{@user.api_key}",
          "country": "thailand",
          "recipe_link": "https://www.tastingtable.com/",
          "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
      }
      end

      it "creates a new favorite" do
        post('/api/v1/favorites', headers: @headers, params: JSON.generate(@body))
      end

      it "returns a message indicating successful creation and a 201 status code" do
        post('/api/v1/favorites', headers: @headers, params: JSON.generate(@body))

        message = JSON.parse(response.body, symbolize_names: true)


        expect(response).to be_successful
        expect(response.body).to eq({ "success": "Favorite added successfully" })
      end
    end
  end

end