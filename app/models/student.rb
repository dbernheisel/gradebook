class Student < User
  has_many :grades
  has_many :guardians, through: :guardian_relationships
  has_many :teachers, through: :instructor_relationships

end
