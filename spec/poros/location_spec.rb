require 'rails_helper'

RSpec.describe Location do
  it 'exists with attributes' do

    data = {:results=>
  [{:address_components=>
     [{:long_name=>"Denver", :short_name=>"Denver", :types=>["locality", "political"]},
      {:long_name=>"Denver County", :short_name=>"Denver County", :types=>["administrative_area_level_2", "political"]},
      {:long_name=>"Colorado", :short_name=>"CO", :types=>["administrative_area_level_1", "political"]},
      {:long_name=>"United States", :short_name=>"US", :types=>["country", "political"]}],
    :formatted_address=>"Denver, CO, USA",
    :geometry=>
     {:bounds=>{:northeast=>{:lat=>39.91424689999999, :lng=>-104.6002959}, :southwest=>{:lat=>39.614431, :lng=>-105.109927}},
      :location=>{:lat=>39.7392358, :lng=>-104.990251},
      :location_type=>"APPROXIMATE",
      :viewport=>{:northeast=>{:lat=>39.91424689999999, :lng=>-104.6002959}, :southwest=>{:lat=>39.614431, :lng=>-105.109927}}},
    :place_id=>"ChIJzxcfI6qAa4cR1jaKJ_j0jhE",
    :types=>["locality", "political"]}],
 :status=>"OK"}

    location = Location.new(data)

    expect(location).to be_a Location
    expect(location.name).to eq(data[:results][0][:formatted_address])
    expect(location.lat).to eq(data[:results][0][:geometry][:location][:lat])
    expect(location.lon).to eq(data[:results][0][:geometry][:location][:lng])
  end
end
