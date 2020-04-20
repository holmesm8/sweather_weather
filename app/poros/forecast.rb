class Forecast
  attr_reader :id, :name, :data, :current, :hourly, :daily

  def initialize(data, coords)
    @id = nil
    @name = coords.location.name
    @data = data
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
