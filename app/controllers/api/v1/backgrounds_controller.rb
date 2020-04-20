class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundService.new(params["location"]).background
    render json: BackgroundSerializer.new(background)
  end
end
