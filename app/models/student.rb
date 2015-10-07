class Student < User
  has_many :grades
  has_many :assignments, through: :grades
  has_many :guardian_relationships
  has_many :instructor_relationships
  has_many :guardians, through: :guardian_relationships
  has_many :instructors, through: :instructor_relationships
end
