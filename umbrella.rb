p "Where are you located?"

user_location = gets.chomp

p user_location
# Go to Google Maps
# Search for user_location
gmaps_key = ENV['GMAPS_KEY']

gmaps_api_url= "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{gmaps_key}"
p gmaps_api_url

require"open-uri"

raw_response = URI.open(gmaps_api_url).read
require "json"
parsed_data = JSON.parse(raw_response)
 result_array = parsed_data.fetch("results")
 first_result= result_array.at(0)
 geo = first_result.fetch("geometry")
loc =geo.fetch("location")
latitude = loc.fetch("lat")
longitude = loc.fetch("lng")
p latitude
p longitude
