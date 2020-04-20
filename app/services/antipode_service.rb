class AntipodeService
  attr_reader :antipode

  def initialize(location)
    coords = GoogleService.new(location)
    response = Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes') do |f|
      f.headers["api_key"] = "#{ENV['AMYPOSE_API_KEY']}"
      f.params["lat"] = coords.location.lat
      f.params["long"] = coords.location.lon
    end
    data = JSON.parse(response.body, symbolize_names: true)[:data]
    # @antipode = Antipode.new(data, location)
  end
end
