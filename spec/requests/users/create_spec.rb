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
      require 'pry'; binding.pry

      expect(User.last.name).to eq("Noah van Ekdom")
      expect(User.last.email).to eq(parsed[:email])



      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:data)
      expect(json[:data]).to be_a Hash

      data = json[:data]
      expect(data).to have_key(:id)
      expect(data).to have_key(:type)
      expect(data).to have_key(:attributes)

      expect(data).to_not have_key(:name)

      attributes = data[:attributes]

    end
  end
end