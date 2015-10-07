class InstructorRelationship < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :student
end
