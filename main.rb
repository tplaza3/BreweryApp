# Using SQL and Ruby with Sinatra.
require "rubygems"
require "bundler"
Bundler.require

#require "geocoder"

require_relative "./models/user.rb"
require_relative "./models/brewery.rb"
require_relative "./models/beer.rb"

require_relative "./routes/users.rb"
require_relative "./routes/breweries.rb"
require_relative "./routes/beers.rb"

brewery_db = BreweryDB::Client.new do |config|
  config.api_key = "4dab8cba42dd1e5fb54f77a8340575b0"
end


#
# include Geocoder::Model::Mongoid
# reverse_geocoded_by :coordinates
# after_validation :reverse_geocode  # auto-fetch address
#
# rake db:mongoid:create_indexes


post "/city_brewery_list" do
  @city = params["city"]
  @locations = brewery_db.locations.all(locality: @city)

  erb :city_brewery_list
end




#-------------------------------------------------------------------------------------------------------------------------------


#---------------------------------------------------------------------------------------------------------------------------------


#binding.pry
  



