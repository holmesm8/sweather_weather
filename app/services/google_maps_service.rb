class GoogleMapsService
  attr_reader :roadtrip

  def initialize(origin, destination)
    data = get_directions("maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=#{ENV['GOOGLE_API_KEY']}
")
    @roadtrip = Roadtrip.new(data)
  end

  private

    def get_directions(url)
      response = conn.get(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new(url: "https://maps.googleapis.com")
    end
end
