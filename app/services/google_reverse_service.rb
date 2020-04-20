class GoogleReverseService
  attr_reader :name

  def initialize(lat, long)
    data = get_coordinates("maps/api/geocode/json?latlng=#{lat},#{long}&key=#{ENV['GOOGLE_API_KEY']}")
    @name = data[:results][0][:formatted_address]
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
