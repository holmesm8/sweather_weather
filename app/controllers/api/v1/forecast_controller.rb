class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastService.new(params["location"]).forecast
    render json: ForecastSerializer.new(forecast)
  end
end
