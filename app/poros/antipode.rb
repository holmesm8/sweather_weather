class Antipode
  attr_reader :id

  def initialize(data)
    # require "pry"; binding.pry
    @id = nil
    @name = GoogleReverseService.new(data[:attributes][:lat], data[:attributes][:long]).name
    @weather_data = ForecastService.new(@name).forecast
    require "pry"; binding.pry
  end

  


end
