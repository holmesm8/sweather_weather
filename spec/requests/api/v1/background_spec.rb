require 'rails_helper'

describe 'Background' do
  it 'returns a url of the city' do
    location = "denver,co"

    get "/api/v1/backgrounds?location=#{location}"

    expect(response).to be_successful
    background = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(background).to have_key(:attributes)
    expect(background[:attributes]).to have_key(:url)
  end
end
