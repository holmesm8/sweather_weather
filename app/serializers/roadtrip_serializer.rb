class RoadtripSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :origin_name, :destination_name, :travel_time, :temperature, :weather_description
end
