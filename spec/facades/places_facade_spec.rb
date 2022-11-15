require 'rails_helper'

RSpec.describe 'the places facade' do
  it 'can create a poro for a tourist sight', :vcr do
    place = PlacesFacade.tourist_sights([44.0, 2.0]).first

    expect(place).to be_instance_of(TouristSight)
    expect(place.id).to eq "null"
    expect(place.name).to be_a String
    expect(place.type).to eq("tourist_sight")
    expect(place.address).to be_a String
  end
end