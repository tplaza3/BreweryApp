
#Index
get "/breweries/:brewery_id/beers" do
  @brewery = Brewery.find(params[:brewery_id])
  @all_beers = @brewery.beers
  erb :"beers/beer_index"
end


# New
get "/breweries/:brewery_id/new_beer" do
  @brewery = Brewery.find(params[:brewery_id])
  @all_breweries = Brewery.all
  erb :"beers/beer_new"
end

get "/beers/new_plus_brewery" do
  erb :"beers/beer_new_plus_brewery"
end

post "/beers/create_plus_brewery" do
  @beer = Beer.create({name: params[:name], style: params[:style], rating: params[:rating], comments: params[:comments]})
  # @beer.create_brewery({name: params[:brewery_name]})
  bw = Brewery.create(params[:brewery_name])
  @beer.brewery = bw
  @beer.save
  erb :"beers/beer_create_plus_brewery"
end

# Create
post "/breweries/:brewery_id/create_beer" do
  rating = params[:rating].to_i
  @beer = Beer.create({name: params[:name], style: params[:style], rating: rating, comments: params[:comments], brewery_id: params[:brewery_id]})

  erb :"beers/beer_create"
end

# Edit
get "/beers/:beer_id/edit" do
  @beer = Beer.find(params[:beer_id])
  @all_breweries = Brewery.all
  erb :"beers/beer_edit"
end

# Update
post "/beers/:beer_id/update" do
  @beer = Beer.find(params[:beer_id])
  rating = params[:rating].to_i
  @beer.update_attributes({name: params[:name], style: params[:style], rating: rating, comments: params[:comments], brewery_id: params[:brewery_id]})

  erb :"beers/beer_update"
end

# Show
get "/beers/:beer_id" do
  @beer = Beer.find(params[:beer_id])
  
  erb :"beers/beer_detail"
end


# Delete

get"/beers/:beer_id/delete" do
  Beer.find(params[:beer_id]).delete
  
  erb :"beers/beer_delete"
end