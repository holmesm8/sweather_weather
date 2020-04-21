# Sweather Weather

### Description
Sweather Weather is the back-end functionality for a web application that provides forecast information as well as forecast information for a destination.

The intention of the back-end is to provide API endpoints for the front-end team requirements based on their wireframes. This includes location, weather forecasts, background images of that specific location, user signup and login, and a roadtrip feature that shows travel time and destination forecast.

### Installation Locally
* Install Ruby 2.6.3
* Install Rails 6.0.2
* Clone this repo to your local machine
* bundle install
* rake db:{create,migrate}

This rails api app uses the following gems for testing:
   * rspec-rails
   * shoulda-matchers
   * simplecov

To run the test suite, simply run the command `rspec` from your terminal.

The application also uses the bcrypt gem for password encryption for users.

### API Keys Needed
* Google API
* OpenWeatherMap API
* Unsplash API
