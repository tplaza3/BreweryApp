#Index
get "/breweries" do
  @all_breweries = Brewery.all
  
  erb :"breweries/brewery_index"
end


# New
get "/breweries/new" do

  erb :"breweries/brewery_new"
end

# Create
post "/breweries/create" do
  @brewery = Brewery.create({name: params[:name]})

  erb :"breweries/brewery_create"
end

# Edit
get "/breweries/:brewery_id/edit" do
  @brewery = Brewery.find(params[:brewery_id])
   
  erb :"breweries/brewery_edit"
end

# Update
post "/breweries/:brewery_id/update" do
  @brewery = Brewery.find(params[:brewery_id])
  @brewery.update_attributes({name: params[:name]})

  erb :"breweries/brewery_update"
end

# Show
get "/breweries/:brewery_id" do
  @brewery = Brewery.find(params[:brewery_id])
  
  erb :"breweries/brewery_detail"
end


# Delete

get"/breweries/:brewery_id/delete" do
  Brewery.find(params[:brewery_id]).delete
  
  erb :"breweries/brewery_delete"
end
