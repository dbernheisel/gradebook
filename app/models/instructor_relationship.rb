class InstructorRelationship < ActiveRecord::Base
  belongs_to :instructor, -> { where role: "instructor" }, class_name: 'User'
  belongs_to :student, -> { where role: "student" }, class_name: 'User'
end
