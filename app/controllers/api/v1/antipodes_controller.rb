class Api::V1::AntipodesController < ApplicationController
  def show
    antipode = AntipodeService.new(params["location"])
  end
end
