# Using SQL and Ruby with Sinatra.
require "rubygems"
require "bundler"
Bundler.require

require "pry"

require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"

require "sqlite3"
require "brewery_db"
#require "geocoder"

require_relative "./models/user.rb"
require_relative "./models/brewery.rb"
require_relative "./models/beer.rb"

brewery_db = BreweryDB::Client.new do |config|
  config.api_key = "4dab8cba42dd1e5fb54f77a8340575b0"
end


#
# include Geocoder::Model::Mongoid
# reverse_geocoded_by :coordinates
# after_validation :reverse_geocode  # auto-fetch address
#
# rake db:mongoid:create_indexes

#Index
get "/users" do
  @all_users = User.all
  @user = User.find(params[:user_id])
  
  erb :user_index
end


# New
get "/users/new" do

  erb :user_new
end

# Create
post "/users/create" do
  @user = User.create({name: params[:name]})

  erb :user_create
end

# Edit
get "/users/:user_id/edit" do
  @all_breweries = Beer.all
  @user = User.find(params[:user_id])

  erb :user_edit
end

# Update
post "/users/:user_id/update" do
  @user = User.find(params[:user_id])
  @user.update_attributes({name: params[:name]})
  
  params[:breweries].each do |brewery_id|
      @user.breweries << Brewery.find(brewery_id)
    end

  erb :user_update
end

# Show
get "/users/:user_id" do
  @user = User.find(params[:user_id])

  erb :user_detail
end


# Delete

get "/users/:user_id/delete" do
  User.find(params[:user_id]).delete

  erb :user_delete
end


post "/city_brewery_list" do
  @city = params["city"]
  @locations = brewery_db.locations.all(locality: @city)

  erb :city_brewery_list
end



#-------------------------------------------------------------------------------------------------------------------------------

#Index
get "/breweries" do
  @all_breweries = Brewery.all
  
  erb :brewery_index
end


# New
get "/breweries/new" do

  erb :brewery_new
end

# Create
post "/breweries/create" do
  @brewery = Brewery.create({name: params[:name]})

  erb :brewery_create
end

# Edit
get "/breweries/:brewery_id/edit" do
  @brewery = Brewery.find(params[:brewery_id])
   
  erb :brewery_edit
end

# Update
post "/breweries/:brewery_id/update" do
  @brewery = Brewery.find(params[:brewery_id])
  @brewery.update_attributes({name: params[:name]})

  erb :brewery_update
end

# Show
get "/breweries/:brewery_id" do
  @brewery = Brewery.find(params[:brewery_id])
  
  erb :brewery_detail
end


# Delete

get"/breweries/:brewery_id/delete" do
  Brewery.find(params[:brewery_id]).delete
  
  erb :brewery_delete
end

#---------------------------------------------------------------------------------------------------------------------------------

#Index
get "/breweries/:brewery_id/beers" do
  @brewery = Brewery.find(params[:brewery_id])
  @all_beers = @brewery.beers
  erb :beer_index
end


# New
get "/breweries/:brewery_id/new_beer" do
  @brewery = Beer.find(params[:brewery_id])
  @all_breweries = Brewery.all
  erb :beer_new
end

get "/beers/new_plus_brewery" do
  erb :beer_new_plus_brewery
end

post "/beers/create_plus_brewery" do
  @beer = Beer.create({name: params[:name], style: params[:style], rating: params[:rating], comments: params[:comments]})
  # @beer.create_brewery({name: params[:brewery_name]})
  bw = Brewery.create(params[:brewery_name])
  @beer.brewery = bw
  @beer.save
  erb :beer_create_plus_brewery
end

# Create
post "/breweries/:brewery_id/create_beer" do
  @beer = Beer.create({name: params[:name], style: params[:style], rating: params[:rating], comments: params[:comments], brewery_id: params[:brewery_id]})

  erb :beer_create
end

# Edit
get "/beers/:beer_id/edit" do
  @beer = Beer.find(params[:beer_id])
  @all_breweries = Brewery.all
  erb :beer_edit
end

# Update
post "/beers/:beer_id/update" do
  @beer = Beer.find(params[:beer_id])
  @beer.update_attributes({name: params[:name], style: params[:style], rating: params[:rating], comments: params[:comments], brewery_id: params[:brewery_id]})

  erb :beer_update
end

# Show
get "/beers/:beer_id" do
  @beer = Beer.find(params[:beer_id])
  
  erb :beer_detail
end


# Delete

get"/beers/:beer_id/delete" do
  Beer.find(params[:beer_id]).delete
  
  erb :beer_delete
end

#binding.pry
  



