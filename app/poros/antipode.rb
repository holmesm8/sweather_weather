class Antipode
  attr_reader :id, :location_name, :search_location

  def initialize(data, location)
    @id = nil
    @location_name = GoogleReverseService.new(data[:attributes][:lat], data[:attributes][:long]).name
    @weather_data = ForecastService.new(@location_name).forecast
    @search_location = location
  end

  def forecast
    hash = {:summary => summary, :current_temperature => current_temperature}
  end

  def summary
    @weather_data.current[:weather][0][:main]
  end

  def current_temperature
    @weather_data.current[:temp]
  end
end
