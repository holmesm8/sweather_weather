class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location_name, :summary, :current_temperature, :search_location
end
