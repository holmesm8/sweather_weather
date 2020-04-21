class Roadtrip
  attr_reader :id, :origin_name, :destination_name, :travel_time, :weather, :destination_coords

  def initialize(data)
    @id = nil
    @travel_time = data[:routes][0][:legs][0][:duration][:text]
    @origin_name = data[:routes][0][:legs][0][:start_address]
    @destination_name = data[:routes][0][:legs][0][:end_address]
    @destination_coords = data[:routes][0][:legs][0][:end_location]
    @weather = ForecastService.new(data[:routes][0][:legs][0][:end_address])
  end

  def temperature
    @weather.forecast.data[:current][:temp]
  end

  def weather_description
    @weather.forecast.data[:current][:weather][0][:main]
  end
end
