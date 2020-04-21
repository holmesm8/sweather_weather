class Api::V1::RoadtripsController < ApplicationController
  def show
    if User.find_by(api_key: params["api_key"])
      roadtrip = GoogleMapsService.new(params["origin"], params["destination"]).roadtrip
      render json: RoadtripSerializer.new(roadtrip)
    else
      render json: {error: 'Please check your API Key'}, status: 401
    end
  end
end
