class Grade < ActiveRecord::Base
  belongs_to :student, class_name: "User", foreign_key: "student_id"
  belongs_to :assignment

  validates :student, uniqueness: { scope: :assignment,
    message: "only one grade per student per assignment" }
end
