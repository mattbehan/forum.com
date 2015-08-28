post "/questions/:question_id/answers" do

  @answer = Answer.new(body: params[:answer][:body], user_id: sessions_user_id, question_id: params[:question_id])
  if @answer.save
    p params
    p @question
    redirect "/questions/#{params[:question_id]}"
  else
    erb :'/questions/show'
  end
end
