require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: "Mr. Bean", email: "justalilbean@gmail.com")
  end

  describe 'validations' do

  end

  describe 'relationships' do

  end

  describe 'methods' do
    describe 'add_api_key' do
      it 'generates a random string for an api key' do

        @user.add_api_key

        expect(@user.api_key).to be_an String
      end
    end
  end
end
