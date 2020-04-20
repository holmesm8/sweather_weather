class ForecastService
  attr_reader :forecast

  def initialize(location)
    coords = GoogleService.new(location)
    data = get_weather("data/2.5/onecall?APPID=#{ENV['WEATHER_API_KEY']}&lon=#{coords.location.lon}&lat=#{coords.location.lat}&units=imperial")
    @forecast = Forecast.new(data, coords)
  end

  private

    def get_weather(url)
      response = conn.get(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new(url: "https://api.openweathermap.org/")
    end
end
