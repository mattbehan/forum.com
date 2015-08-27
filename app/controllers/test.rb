get "/users" do
  #show layout with the users button highlighted orange
  #get all the users from the db
  #render an erb with an each loop to diplay every user in a div
    #username, location
    @users = User.all
    erb :'/users/index'
end

get "/users/:id" do
  user = current_user
  erb :'/users/show'
end
