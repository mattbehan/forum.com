get '/' do
  erb :index
end

get "/sessions/clear" do
  session.clear
end

get "sessions/viewer" do
  session.inspect
end
