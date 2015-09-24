get "/questions/:question_id/answers/new" do
  @answer = Answer.new
  erb :"answers/new"
end

post "/questions/:question_id/answers" do

  @answer = Answer.new(body: params[:answer][:body], user_id: sessions_user_id, question_id: params[:question_id])
  if @answer.save

    redirect "/questions/#{params[:question_id]}"
  else
    erb :'answers/show'
  end

end



get "/answers/:id/edit" do

end

put "/answers/:id" do

end

delete "/answers/:id" do

end
