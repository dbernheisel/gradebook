class GuardianRelationship < ActiveRecord::Base
  belongs_to :guardian
  belongs_to :student
end
