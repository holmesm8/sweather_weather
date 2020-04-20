require 'rails_helper'

describe 'Users Login' do
  it 'can login a user through an endpoint' do
    user_params = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params
    user = User.last

    user_params = {email: "test@test.com", password: "test"}

    post "/api/v1/sessions", params: user_params


    expect(response).to be_successful
    session = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response.status).to eq(200)
    expect(session[:attributes][:api_key]).to eq(user.api_key)
  end

  it 'can deny a user with bad credentials' do
    user_params = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params
    user = User.last

    user_params = {email: "test@test.com", password: "hunter2"}

    post "/api/v1/sessions", params: user_params
    session = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(session[:error]).to eq('Credentials Do Not Match')
  end
end
