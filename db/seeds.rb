module Seed

  def self.run
    20.times do
      email = Faker::Internet.email
      display_name = Faker::Internet.user_name
      pword = Faker::Internet.password + "X"
      location = Faker::Address.city
      User.create(email: email, display_name: display_name, password: pword, location: location)

      lorem_title = Faker::Lorem.sentence
      lorem_body = Faker::Lorem.paragraph
      Question.create(title: lorem_title, body: lorem_body)
    end
  end

end
