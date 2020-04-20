class Forecast
  attr_reader :id, :name, :data

  def initialize(data, coords)
    @id = nil
    @name = coords.location.name
    @data = data
    # @current = current
    # @hourly = hourly
    # @daily = daily
  end

  def current
    @data[:current].slice(:sunrise, :sunset, :temp, :feels_like, :humidity, :uvi, :weather)
  end

  def hourly
    @data[:hourly].map {|data| data.slice(:dt, :temp, :weather)}[0..7]
  end

  def daily
    @data[:daily].map {|data| data.slice(:dt, :temp, :weather)}[0..4]
  end
end
