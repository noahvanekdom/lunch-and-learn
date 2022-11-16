require 'rails_helper'

RSpec.describe 'the create favorite API endpoint' do
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
  describe "happy path" do
    describe "when a post request is sent to (api/v1/favorites)" do
      it "creates a new favorite" do
        expect(@user.favorites).to eq([])

        post('/api/v1/favorites', headers: @headers, params: JSON.generate(@body))

        expect(@user.favorites.count).to eq 1
      end

      it "returns a message indicating successful creation and a 201 status code" do
        post('/api/v1/favorites', headers: @headers, params: JSON.generate(@body))

        message = JSON.parse(response.body, symbolize_names: true)


        expect(response).to be_successful
        expect(message).to eq({:success=>"Favorite added successfully"})

        favorite = Favorite.last
        expect(favorite.user).to eq(@user)
        expect(favorite.country).to eq("thailand")
        expect(favorite.recipe_link).to eq("https://www.tastingtable.com/")
        expect(favorite.recipe_title).to eq("Crab Fried Rice (Khaao Pad Bpu)")
      end
    end

    describe 'sad path' do
      context 'when an invalid api key is provided' do
        it 'returns a 404 status with message' do
          body = {
            "api_key": "FAILKEY",
            "country": "thailand",
            "recipe_link": "https://www.tastingtable.com/",
            "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
        }
          post('/api/v1/favorites', headers: @headers, params: JSON.generate(body))

          expect(response.status).to eq 404
          message = JSON.parse(response.body, symbolize_names: true )
          expect(message).to have_key(:error)
          expect(message[:error]).to eq({details: "That api key does not exist"})
        end
      end

      context 'when invalid parameters are submitted' do
        it 'returns a 400 message with an appropriate error message' do
          body = {
            "api_key": "#{@user.api_key}",
            "recipe_link": "https://www.tastingtable.com/",
            "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
                 }

          post('/api/v1/favorites', headers: @headers, params: JSON.generate(body))

          expect(response).to_not be_successful
          json = JSON.parse(response.body, symbolize_names: true)
          expect(json).to have_key(:errors)
          expect(json.keys.count).to eq 1
          expect(json[:errors]).to have_key(:country)
          expect(json[:errors][:country]).to eq(["can't be blank"])
        end
      end
    end
  end
end