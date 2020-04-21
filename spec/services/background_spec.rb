require 'rails_helper'

RSpec.describe "Background Service" do
  describe "instance methods" do
    it "returns the url of a photo from location provided" do
      location = "denver,co"
      service = BackgroundService.new(location)

      expect(service.background.url).to eq("https://images.unsplash.com/photo-1570585429632-e8b74372a3ed?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb&ixid=eyJhcHBfaWQiOjEyODU4MX0")
    end
  end
end
