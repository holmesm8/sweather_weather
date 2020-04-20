# refactored out after realizing facade is for html view

class BackgroundFacade
  attr_reader :id, :url

  def initialize(location)
    @id = nil
    # background poro with unsplash json data
    unsplash_data = BackgroundService.new(location)
    @url = unsplash_data.background.url
  end
end
