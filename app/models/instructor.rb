class Instructor < User
  has_many :assignments
  has_many :instructor_relationships
  has_many :students, through: :instructor_relationships
  has_many :grades, through: :assignments
end
