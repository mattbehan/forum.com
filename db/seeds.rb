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
      Question.create(title: question_title, body: question_body)

      answer_body = Faker::Lorem.paragraph(3)
      Answer.create(body: answer_body)
    end
  end

end
