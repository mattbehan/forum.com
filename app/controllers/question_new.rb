post "/questions" do
  p params
  @question = Question.new(title: params[:question][:title], body: params[:question][:body])
  if @question.save
    redirect "/"
  else
    erb :"/questions/new"
  end

end

get "/questions/new" do

  @questions = Question.new
  erb :"/questions/new"

end
