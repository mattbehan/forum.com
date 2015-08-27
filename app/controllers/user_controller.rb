get "/register" do
  erb :"users/register"
end

# javascript to inform the user that they must enter a password with at least 8 chars, lowercase letters, uppercase, and numbers/sybmols
post "/register" do
  @email = params[:email]
  @password = params[:password]
  @display_name = params[:display_name]
  @password.validate_new_password
  @user = User.new(email: @email, password: @password, display_name: @display_name)
  if @user.save
    redirect ""
  end
end

# delete profile should be done in Ajax

get "/login" do

end

post "/login" do

end

get "/logout" do

end

post "/logout" do

end

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
