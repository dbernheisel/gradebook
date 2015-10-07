class Guardian < User
  has_many :guardian_relationships
  has_many :students, through: :guardian_relationships
  has_many :grades, through: :students
  has_many :assignments, through: :grades
end
