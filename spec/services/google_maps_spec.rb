require 'rails_helper'

RSpec.describe "Google Maps Service" do
  it "returns a roadtrip poro" do
    origin = "denver,co"
    destination = "pueblo,co"
    service = GoogleMapsService.new(origin, destination)

    expect(service.roadtrip).to be_a Roadtrip
  end
end
