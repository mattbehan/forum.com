module Seed

  def self.run
    20.times do
      email = Faker::Internet.email
      display_name = Faker::Internet.user_name
      password = Faker::Internet.password
      User.create(email: email, display_name: display_name, password: password)

    end
  end

end
