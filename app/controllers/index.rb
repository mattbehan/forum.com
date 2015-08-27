get '/' do
  @top_questions = Question.all.sample(10)
  erb :index
end

get "/sessions/clear" do
  session.clear
end

get "sessions/viewer" do
  session.inspect
end

get "sessions/set_session_to/:id" do
  session[:user_id] = params[:id]
end
