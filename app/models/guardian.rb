class Guardian < User
  has_many :students, through: :guardian_relationships
  has_many :grades, through: :students

end
