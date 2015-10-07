# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Student.destroy_all
Guardian.destroy_all
Instructor.destroy_all
Grade.destroy_all
Assignment.destroy_all

10.times do
  Guardian.create!(
    email: Faker::Internet.email,
    fullname: Faker::Name.name,
    password: Faker::Internet.password(10, 20),
    role: "guardian"
    )
end

60.times do
  Student.create!(
    email: Faker::Internet.email,
    fullname: Faker::Name.name,
    password: Faker::Internet.password(10, 20),
    role: "student"
    )
end

30.times do
  Instructor.create!(
    email: Faker::Internet.email,
    fullname: Faker::Name.name,
    password: Faker::Internet.password(10, 20),
    role: "instructor"
    )
end


instructor = Instructor.create!(
  email: "instructor@test.com",
  fullname: Faker::Name.name,
  password: "test1234",
  role: "instructor"
  )

student = Student.create!(
  email: "student1@test.com",
  fullname: Faker::Name.name,
  password: "test1234",
  role: "student"
  )
student2 = Student.create!(
  email: "student2@test.com",
  fullname: Faker::Name.name,
  password: "test1234",
  role: "student"
  )
student3 = Student.create!(
  email: "student3@test.com",
  fullname: Faker::Name.name,
  password: "test1234",
  role: "student"
  )

guardian = Guardian.create!(
  email: "guardian@test.com",
  fullname: Faker::Name.name,
  password: "test1234",
  role: "guardian"
  )

100.times do
  GuardianRelationship.create!(
    guardian_id: (1..10).to_a.sample,
    student_id: (11..60).to_a.sample
    )
  InstructorRelationship.create!(
    instructor_id: (61..100).to_a.sample,
    student_id: (11..60).to_a.sample
    )
end

InstructorRelationship.create!(
  student_id: student.id,
  instructor_id: instructor.id
  )
InstructorRelationship.create!(
  student_id: student2.id,
  instructor_id: instructor.id
  )
InstructorRelationship.create!(
  student_id: student3.id,
  instructor_id: instructor.id
  )


GuardianRelationship.create!(
  student_id: student.id,
  guardian_id: guardian.id
  )
GuardianRelationship.create!(
  student_id: student2.id,
  guardian_id: guardian.id
  )


100.times do
  Assignment.create!(
    name: Faker::Hacker.adjective,
    date: Faker::Date.between(2.days.ago, Date.today),
    instructor_id: (61..101).to_a.sample
    )
end

(11..31).to_a.each do |i|
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(2.days.ago, Date.today),
    student_id: i+10,
    assignment_id: i+1
  )
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(10.days.ago, Date.today),
    student_id: i+10,
    assignment_id: i+2
  )
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(30.days.ago, Date.today),
    student_id: i+10,
    assignment_id: i+3
  )
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(100.days.ago, Date.today),
    student_id: i+10,
    assignment_id: i+4
  )
end

(102..104).to_a.each do |i|
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(2.days.ago, Date.today),
    student_id: i,
    assignment_id: i-30
  )
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(10.days.ago, Date.today),
    student_id: i,
    assignment_id: i-31
  )
  Grade.create!(
    score: rand(0..100.00),
    date: Faker::Date.between(30.days.ago, Date.today),
    student_id: i,
    assignment_id: i-32
  )
end


