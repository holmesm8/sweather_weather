class ForecastFacade
  attr_reader :id, :name, :data, :current, :hourly, :daily

  def initialize(location)
    @id = nil
    # coords is getting the city coordinates
    location_coords = GoogleService.new(location)
    # name of city
    @name = location_coords.location.name
    # location object with the weather data returned
    @data = ForecastService.new(location_coords).forecast.data
    @current = current
    @hourly = hourly
    @daily = daily
  end

  def current
    @data[:current]
  end

  def hourly
    @data[:hourly]
  end

  def daily
    @data[:daily]
  end
end
