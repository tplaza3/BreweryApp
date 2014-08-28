#Index

get "/users" do
  @all_users = User.all
  
  erb :"users/user_index"
end


# New
get "/users/new" do

  erb :"users/user_new"
end

# Create
post "/users/create" do
  @user = User.create({name: params[:name]})

  erb :"users/user_create"
end

# Edit
get "/users/:user_id/edit" do
  @all_breweries = Brewery.all
  @user = User.find(params[:user_id])

  erb :"users/user_edit"
end

# Update
post "/users/:user_id/update" do
  @user = User.find(params[:user_id])
  @user.update_attributes({name: params[:name]})
  
  params[:breweries].each do |brewery_id|
      @user.breweries << Brewery.find(brewery_id)
    end

  erb :"users/user_update"
end

# Show
post "/users/detail" do
  @user = User.find(params[:user_id])

  erb :"users/user_detail"
end


# Delete

get "/users/:user_id/delete" do
  User.find(params[:user_id]).delete

  erb :"users/user_delete"
end


