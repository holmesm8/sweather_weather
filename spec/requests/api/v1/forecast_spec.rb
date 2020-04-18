require 'rails_helper'

describe 'Forecast' do
  it 'sends forecast data to a city' do
    location = "denver,co"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    forecast = JSON.parse(response.body, symbolize_name: true)[:data]

    expect(forecast).to have_key('type')
    expect(forecast).to have_key('attributes')

  end
end
