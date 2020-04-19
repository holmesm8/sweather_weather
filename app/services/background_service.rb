class BackgroundService
  attr_reader :background

  def initialize(location)
    data = get_json("search/photos?query=#{location}&client_id=#{ENV['UNSPLASH_API_KEY']}&per_page=1")
    @background = Background.new(data)
  end

  private

    def get_json(url)
      response = conn.get(url)
      json_response = JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      conn = Faraday.new(url: "https://api.unsplash.com")
    end
end
