require 'rails_helper'

describe 'Users Create' do
  it 'can create a user through api endpoint' do
    user_params = {email: "test@test.com", password: "test", password_confirmation: "test"}

    post "/api/v1/users", params: user_params

    user = User.last

    expect(response).to be_successful
    expect(response.status).to eq(201)
    user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to have_key(:email)
    expect(user[:attributes]).to have_key(:api_key)
  end

  it 'can return an error if passwords do not match' do
    user_params = {email: "test@test.com", password: "test", password_confirmation: "testtest"}

    post "/api/v1/users", params: user_params
    bad_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(bad_response[:password_confirmation][0]).to eq("doesn't match Password")
  end

  it 'can return an error if the email is not unique' do
    user_params1 = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params1

    user_params2 = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params2

    bad_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(400)
    expect(bad_response[:email][0]).to eq("has already been taken")
  end
end
