class Api::V1::AntipodesController < ApplicationController
  def show
    antipode = AntipodeService.new(params["location"]).antipode
    render json: AntipodeSerializer.new(antipode)
  end
end
