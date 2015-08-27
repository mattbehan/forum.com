get "/register" do
  erb :"users/register", layout: false
end

# javascript to inform the user that they must enter a password with at least 8 chars, lowercase letters, uppercase, and numbers/sybmols
post "/register" do
  # @email = params[:email]
  # @password = params[:password]
  # @display_name = params[:display_name]
  @user = User.new(params[:user])
  if @user.save
    redirect "/login"
  else
    erb :"users/register", layout: false
  end
end

# delete profile should be done in Ajax

get "/login" do
  erb :"users/login", layout: false
end

post "/login" do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users"
  else
    erb :"users/login", layout: false
  end
end

get "/logout" do
  erb :"users/logout"

end

post "/logout" do
  sessions_user_id = nil
  redirect "/questions"

end

# needs route to be changed
get "/profile/" do

end


get "/users" do
  #show layout with the users button highlighted orange
  #get all the users from the db
  #render an erb with an each loop to diplay every user in a div
    #username, location
end


# when you register stack overflow actually then redirects you to a page with a link to your email to confirm your registration.
# It also prompts you with captia tests when you input your information.
# When you confirm your registration it sneds you to a page to complete your registration and also gives you the opportunity to change your information
# http://stackoverflow.com/users/signup/thanks?newreg=ecbfca3e6e5d4ca3a94aad337ca7ce81
