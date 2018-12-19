# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
10.times do
  last_name = Faker::Name.last_name
  User.create(first_name: Faker::Name.first_name,
              last_name: last_name,
              email: last_name.downcase + "@sample.com",
              password: "1234567",
              password_confirmation: "1234567")
end

admin_user = User.create(first_name: "Admin",
                         last_name: "Admin",
                         email: "admin@sample.com",
                         password: "1234567",
                         password_confirmation: "1234567")
admin_user.role = "admin"
admin_user.save

user       = User.create(first_name: "User",
                         last_name: "User",
                         email: "user@sample.com",
                         password: "1234567",
                         password_confirmation: "1234567")

#Categories
2.times do
  Category.create(
    title: Faker::Book.title,
    description: Faker::GameOfThrones.quote
    )
end

#Instructions
10.times do
    ins = Instruction.create(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraph,
      category: Category.all.sample
      )
    2.times do
        q = Quiz.create(
            title: Faker::Book.title,
            level: (1..3).to_a.sample,
            active: true,
            percent_to_pass: 90
            )
        ins.quizzes << q
    end
end

Quiz.all.each do |q|
    6.times do
        qs = Question.create(
               body: Faker::GameOfThrones.quote,
               active: true
            )
        q.questions << qs
    end
end

Question.all.each do |q|
  4.times do
    q.options.build(
        body: Faker::GameOfThrones.quote,
        correct: false
      )
  end
  q.save
  qo = q.options.last
  qo.correct = true
  qo.save
end
