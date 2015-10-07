class Assignment < ActiveRecord::Base
  has_many :grades
  belongs_to :instructor

  default_scope { order("date DESC") }
end
