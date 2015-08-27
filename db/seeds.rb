module Seed

  def self.run
    20.times do
      email = Faker::Internet.email
      display_name = Faker::Internet.user_name
      password = Faker::Internet.password

    end
  end

end
