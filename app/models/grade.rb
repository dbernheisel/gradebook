class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment

  default_scope { order("assignment_id, student_id") }

  validates :student, uniqueness: { scope: :assignment,
    message: "only one grade per student per assignment" }
end
