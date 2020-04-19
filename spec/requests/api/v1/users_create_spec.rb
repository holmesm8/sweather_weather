require 'rails_helper'

describe 'Users Create' do
  it 'can create a user through api endpoint' do
    user_params = {email: "test@test.com", password: "test", password_confirmation: "test"}
    post "/api/v1/users", params: user_params

    user = User.last

    expect(response).to be_successful
    user = JSON.parse(response.body, symbolize_names: true)[:data]
require "pry"; binding.pry
    expect(user).to have_key(:attributes)
    expect(user[:attributes]).to have_key(:email)
    expect(user[:attributes]).to have_key(:api_key)
  end
end
