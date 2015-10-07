# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

97.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
    role: ["instructor", "student", "guardian"].sample,
    )
end

User.create!(
  email: "instructor@test.com",
  password: "test1234",
  role: "instructor")

User.create!(
  email: "student@test.com",
  password: "test1234",
  role: "student")

User.create!(
  email: "guardian@test.com",
  password: "test1234",
  role: "guardian")

100.times do
  GuardianRelationship.create!(
    guardian_id: (1..25).to_a.sample,
    student_id: (26..50).to_a.sample
    )
  InstructorRelationship.create!(
    instructor_id: (51..100).to_a.sample,
    student_id: (26..50).to_a.sample
    )
end
