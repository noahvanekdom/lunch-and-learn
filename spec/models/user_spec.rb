require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it { should validate_presence_of :email }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :email }

  end

  describe 'relationships' do

    it { should have_many :favorites }

  end

  describe 'methods' do
    describe 'add_api_key' do
      before(:each) do
        @user = User.create!(name: "Mr. Bean", email: "justalilbean@gmail.com")
      end

      it 'generates a random string for an api key' do

        expect(@user.api_key).to eq nil

        @user.add_api_key

        expect(@user.api_key).to be_an String
      end
    end
  end
end
