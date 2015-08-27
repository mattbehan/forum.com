get '/' do
  @top_questions = Question.all.sample(10)
  erb :index
end

