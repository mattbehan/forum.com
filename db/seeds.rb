module Seed

  def self.run

    20.times do
      email = Faker::Internet.email
      display_name = Faker::Internet.user_name
      pword = Faker::Internet.password + "X"
      location = Faker::Address.city
      User.create(email: email, display_name: display_name, password: pword, location: location)

      question_title = (Faker::Lorem.sentence).chomp('.') + "?"
      question_body = Faker::Lorem.paragraph(7)
      Question.create(title: question_title, body: question_body, user_id: rand(1..20))

      answer_body = Faker::Lorem.paragraph(3)
      Answer.create(body: answer_body, user_id: rand(1..15), question_id: rand(1..15))
    end

    User.first.cast_vote(1,Answer.first)
    User.second.cast_vote(1,Answer.first)
    User.third.cast_vote(1,Answer.first)
    User.fourth.cast_vote(1,Answer.first)
    User.fifth.cast_vote(1,Answer.first)
    User.first.cast_vote(1,Question.first)
    User.second.cast_vote(1,Question.first)
    User.third.cast_vote(1,Question.first)
    User.fourth.cast_vote(1,Question.first)
    User.fifth.cast_vote(1,Question.first)



  end

end
