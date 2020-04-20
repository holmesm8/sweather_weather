class GoogleService
  attr_reader :location

  def initialize(location)
    data = get_coordinates("maps/api/geocode/json?address=#{location}&key=#{ENV['GOOGLE_API_KEY']}")
    @location = Location.new(data)
  end

  private

    def get_coordinates(url)
      response = conn.post(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new(url: "https://maps.googleapis.com")
    end
end
