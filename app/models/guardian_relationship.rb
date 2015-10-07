class GuardianRelationship < ActiveRecord::Base
  belongs_to :guardian, -> { where role: "guardian" }, class_name: 'User'
  belongs_to :student, -> { where role: "student" }, class_name: 'User'
end
