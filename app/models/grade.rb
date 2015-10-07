class Grade < ActiveRecord::Base
  belongs_to :student
  belongs_to :assignment

  validates :student, uniqueness: { scope: :assignment,
    message: "only one grade per student per assignment" }
end
