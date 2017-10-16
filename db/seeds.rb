User.create!(name:  "yuki",
             email: "yuki@yuki.jp",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

5.times do |i|
  Post.create(title: "title #{i}", body: "body #{i}")
end


