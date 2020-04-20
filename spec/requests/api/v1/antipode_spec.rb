require 'rails_helper'

describe 'Antipode' do
  it 'returns weather info from an antipode' do
    location = "Hong Kong"

    get "/api/v1/antipode?location=#{location}"

    expect(response).to be_successful
    antipode = JSON.parse(response.body, symbolize_names: true)

    expect(antipode[:data]).to have_key(:attributes)
    expect(antipode[:data][:attributes]).to have_key(:location_name)
    expect(antipode[:data][:attributes][:forecast]).to have_key(:summary)
    expect(antipode[:data][:attributes][:forecast]).to have_key(:current_temperature)
    expect(antipode[:data][:attributes]).to have_key(:search_location)
    expect(antipode[:data][:attributes][:search_location]).to eq(location)
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
