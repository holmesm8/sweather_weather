class Background
  attr_reader :id, :url

  def initialize(data)
    @id = nil
    @url = data[:results][0][:urls][:full]
  end

  # def url
  #   @data[:results][0][:urls][:full]
  # end
end
