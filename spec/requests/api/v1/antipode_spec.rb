require 'rails_helper'

describe 'Antipode' do
  it 'returns weather info from an antipode' do
    location = "Hong Kong"

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful
    antipode = JSON.parse(response.body, symbolize_names: true)[:data]
    require "pry"; binding.pry

    expect(forecast).to have_key(:attributes)
    expect(forecast[:attributes]).to have_key(:current)
    expect(forecast[:attributes]).to have_key(:hourly)
    expect(forecast[:attributes]).to have_key(:daily)
  end
end

# expected return
#
# {
#     "data": {
#         "id": "null",
#         "type": "antipode",
#         "attributes": {
#             "location_name": "Antipode City Name",
#             "forecast": {
#                 "summary": "Mostly Cloudy,
#                 "current_temperature": "72",
#             },
#             "search_location": "Hong Kong"
#         }
#     }
# }
