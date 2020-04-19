class Background
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def url
    @data[:results][0][:urls][:full]
  end
end
