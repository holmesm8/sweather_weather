require 'rails_helper'

RSpec.describe "Forecast Service" do
  it "returns a forecast poro" do
    location = "denver,co"
    service = ForecastService.new(location)

    expect(service.forecast).to be_a Forecast
  end
end
