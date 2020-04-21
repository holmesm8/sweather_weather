require 'rails_helper'

RSpec.describe Roadtrip do
  it 'exists with attributes' do

    data ={:geocoded_waypoints=>
  [{:geocoder_status=>"OK", :place_id=>"ChIJzxcfI6qAa4cR1jaKJ_j0jhE", :types=>["locality", "political"]},
   {:geocoder_status=>"OK", :place_id=>"ChIJZbEbB_OiE4cRLrjHaKNrLag", :types=>["locality", "political"]}],
 :routes=>
  [{:bounds=>{:northeast=>{:lat=>39.7419699, :lng=>-104.6040733}, :southwest=>{:lat=>38.2542053, :lng=>-104.9883164}},
    :copyrights=>"Map data ©2020",
    :legs=>
     [{:distance=>{:text=>"112 mi", :value=>180797},
       :duration=>{:text=>"1 hour 48 mins", :value=>6480},
       :end_address=>"Pueblo, CO, USA",
       :end_location=>{:lat=>38.2542053, :lng=>-104.6087488},
       :start_address=>"Denver, CO, USA",
       :start_location=>{:lat=>39.7411598, :lng=>-104.9879112},
       :steps=>
        [{:distance=>{:text=>"157 ft", :value=>48},
          :duration=>{:text=>"1 min", :value=>12},
          :end_location=>{:lat=>39.7414646, :lng=>-104.9883164},
          :html_instructions=>"Head <b>northwest</b> toward <b>Cleveland Pl</b>",
          :polyline=>{:points=>"g}pqFlmx_Sc@n@W`@"},
          :start_location=>{:lat=>39.7411598, :lng=>-104.9879112},
          :travel_mode=>"DRIVING"},
         {:distance=>{:text=>"328 ft", :value=>100},
          :duration=>{:text=>"1 min", :value=>83},
          :end_location=>{:lat=>39.7419699, :lng=>-104.9874109},
          :html_instructions=>"Turn <b>right</b> onto <b>Cleveland Pl</b>",
          :maneuver=>"turn-right",
          :polyline=>{:points=>"c_qqF~ox_Ss@_AYc@SYAI?IAc@"},
          :start_location=>{:lat=>39.7414646, :lng=>-104.9883164},
          :travel_mode=>"DRIVING"},
         {:distance=>{:text=>"2.6 mi", :value=>4234},
          :duration=>{:text=>"8 mins", :value=>475},
          :end_location=>{:lat=>39.703893, :lng=>-104.987511},
          :html_instructions=>"Turn <b>right</b> onto <b>N Broadway</b><div style=\"font-size:0.9em\">Pass by Subway (on the left in 1.2&nbsp;mi)</div>",
          :maneuver=>"turn-right",
          :polyline=>
           {:points=>
             "1"},
          :start_location=>{:lat=>39.7419699, :lng=>-104.9874109},
          :travel_mode=>"DRIVING"},
         {:distance=>{:text=>"0.2 mi", :value=>342},
          :duration=>{:text=>"1 min", :value=>47},
          :end_location=>{:lat=>39.7008247, :lng=>-104.9875948},
          :html_instructions=>"Continue straight onto <b>S Broadway</b>",
          :maneuver=>"straight",
          :polyline=>{:points=>"itiqF|jx_SV?T?~@Ax@?b@@p@?L@L@f@BR@NBbB@@?|@?@?xA?"},
          :start_location=>{:lat=>39.703893, :lng=>-104.987511},
          :travel_mode=>"DRIVING"},
         {:distance=>{:text=>"0.4 mi", :value=>633},
          :duration=>{:text=>"1 min", :value=>68},
          :end_location=>{:lat=>39.6967177, :lng=>-104.9825072},
          :html_instructions=>"Turn <b>left</b> onto the <b>I-25 S</b> ramp",
          :maneuver=>"ramp-left",
          :polyline=>{:points=>"caiqFlkx_SNe@j@iA?Af@cAJOd@u@FGpB{Bv@aAHKb@i@^c@JMNUPSz@aAvBiCnA}Az@aAn@w@"},
          :start_location=>{:lat=>39.7008247, :lng=>-104.9875948},
          :travel_mode=>"DRIVING"},
         {:distance=>{:text=>"65.1 mi", :value=>104753},
          :duration=>{:text=>"1 hour 0 mins", :value=>3580},
          :end_location=>{:lat=>38.8322479, :lng=>-104.8337728},
          :html_instructions=>"Keep <b>left</b>, follow signs for <b>Interstate 25 S</b> and merge onto <b>I-25 S</b>",
          :maneuver=>"keep-left",
          :polyline=>
           {:points=>
             "1"},
          :start_location=>{:lat=>39.6967177, :lng=>-104.9825072},
          :travel_mode=>"DRIVING"},
         {:distance=>{:text=>"43.9 mi", :value=>70687},
          :duration=>{:text=>"37 mins", :value=>2215},
          :end_location=>{:lat=>38.2542053, :lng=>-104.6087488},
          :html_instructions=>"Keep <b>left</b> to stay on <b>I-25 S</b>, follow signs for <b>US-24 E</b><div style=\"font-size:0.9em\">Destination will be on the right</div>",
          :maneuver=>"keep-left",
          :polyline=>
           {:points=>
             "1"},
          :start_location=>{:lat=>38.8322479, :lng=>-104.8337728},
          :travel_mode=>"DRIVING"}],
       :traffic_speed_entry=>[],
       :via_waypoint=>[]}],
    :overview_polyline=>
     {:points=>
       "1"},
    :summary=>"I-25 S",
    :warnings=>[],
    :waypoint_order=>[]}],
 :status=>"OK"}

   roadtrip = Roadtrip.new(data)

   expect(roadtrip).to be_a Roadtrip
   expect(roadtrip.id).to eq(nil)
   expect(roadtrip.travel_time).to eq(data[:routes][0][:legs][0][:duration][:text])
   expect(roadtrip.origin_name).to eq(data[:routes][0][:legs][0][:start_address])
   expect(roadtrip.destination_name).to eq(data[:routes][0][:legs][0][:end_address])
   expect(roadtrip.destination_coords).to eq(data[:routes][0][:legs][0][:end_location])
   expect(roadtrip.weather).to be_a ForecastService
   expect(roadtrip.temperature).to eq(roadtrip.weather.forecast.data[:current][:temp])
   expect(roadtrip.weather_description).to eq(roadtrip.weather.forecast.data[:current][:weather][0][:main])
  end
end
