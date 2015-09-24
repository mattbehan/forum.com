get "/questions" do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/newest' do
  @questions = Question.order(created_at: :desc).limit(10)
  erb :index
end

get "/questions/new" do
  redirect "/login" unless authenticated?
  @questions = Question.new
  erb :"/questions/new"
end

post "/questions" do
  redirect "/login" unless authenticated?
  @question = Question.new(params[:question])
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    erb :"/questions/new"
  end

end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'/questions/show'
end

get "/questions/:id/edit" do
  # alternative authorization method
  @question = current_user.questions.find(params[:id])
  @question.update_attributes(params[:question])
  if @question.valid?
    redirect "/questions/#{@question.id}"
  else
    erb :"questions/edit"
  end
end

put "/questions/:id" do
  # alternative authorization method
  @question = current_user.questions.find(params[:id])
end

delete "/questions/:id" do
  # alternative authorization method
  @question = current_user.questions.find(params[:id])
  @question.destroy()
  redirect "/"
end
