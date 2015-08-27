get "/register" do
  erb :"users/register", layout: false
end

post "/register" do
  @user = User.new(params[:user])
  if @user.save
    redirect "/login"
  else
    erb :"users/register", layout: false
  end
end

get "/login" do
  erb :"users/login", layout: false
end

post "/login" do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :"users/login", layout: false
  end
end

get "/logout" do
  session[:user_id] = nil
  erb :"index"
end

# post "/logout" do
#   sessions_user_id = nil
#   redirect "/"
# end

get "/users" do
  @users = User.all
  erb :'/users/index'
end

get "/users/:id" do
  @user = User.find(params[:id])
  erb :'/users/show'
end
