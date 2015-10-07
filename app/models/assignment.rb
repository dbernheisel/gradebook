class Assignment < ActiveRecord::Base
  has_many :grades
  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
end
