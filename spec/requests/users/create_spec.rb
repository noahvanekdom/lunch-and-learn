require 'rails_helper'

RSpec.describe 'creating users' do
  describe 'happy path' do
    before(:each) do
      @headers = { 'CONTENT_TYPE': 'application/json' }
      @body = { 'name': 'Noah van Ekdom', 'email': "example@example.com" }
    end

    it 'creates a user when the correct information is sent in through the header and body' do

      post('/api/v1/users', headers: @headers, params: JSON.generate(@body))

      expect(response).to be_successful
      expect(response.status).to eq(201)

      expect(User.last.name).to eq("Noah van Ekdom")

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a Hash

      data = json[:data]
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      expect(data).to_not have_key(:name)

      attributes = data[:attributes]
      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to eq("Noah van Ekdom")
      expect(attributes).to have_key(:email)
      expect(attributes[:email]).to eq("example@example.com")
      expect(attributes).to have_key(:api_key)
      expect(attributes[:api_key]).to be_a String
      expect(attributes[:api_key].length).to eq 40
    end

    it 'returns an cogent error response when no email is added' do
      body = { 'name': 'Noah van Ekdom', 'email': "" }
      post('/api/v1/users', headers: @headers, params: JSON.generate(body))

      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)
      expect(error).to have_key(:email)
      expect(error[:email]).to eq(["can't be blank"])
    end
  end
end