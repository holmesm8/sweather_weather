class Api::V1::AntipodesController < ApplicationController
  def show
    # antipode = AntipodeService.new(params["location"]).antipode
    antipode = Antipode.from_location(params["location"])
    render json: AntipodeSerializer.new(antipode)
  end
end
