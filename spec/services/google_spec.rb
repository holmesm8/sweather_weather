require 'rails_helper'

RSpec.describe "Google Service" do
  it "returns a location poro" do
    location = "denver,co"
    service = GoogleService.new(location)

    expect(service.location).to be_a Location
  end
end
