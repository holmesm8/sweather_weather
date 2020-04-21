require 'rails_helper'

describe 'Roadtrip' do
  it 'can expose raodtrip data' do

    user_params = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params

    user_params = {email: "test@test.com", password: "test"}
    post "/api/v1/sessions", params: user_params
    user = User.last

    roadtrip_params = {origin: "Denver,CO", destination: "Pueblo,CO", api_key: user.api_key}
    post "/api/v1/road_trip", params: roadtrip_params

    expect(response).to be_successful
    roadtrip = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(roadtrip).to have_key(:attributes)
    expect(roadtrip[:attributes]).to have_key(:origin_name)
    expect(roadtrip[:attributes]).to have_key(:destination_name)
    expect(roadtrip[:attributes]).to have_key(:travel_time)
    expect(roadtrip[:attributes]).to have_key(:temperature)
    expect(roadtrip[:attributes]).to have_key(:weather_description)
  end

  it 'can expose raodtrip data' do

    user_params = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params

    user_params = {email: "test@test.com", password: "test"}
    post "/api/v1/sessions", params: user_params
    user = User.last

    roadtrip_params = {origin: "Denver,CO", destination: "Pueblo,CO", api_key: 123456}
    post "/api/v1/road_trip", params: roadtrip_params

    roadtrip = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(401)
    expect(roadtrip[:error]).to eq('Please check your API Key')
  end
end
