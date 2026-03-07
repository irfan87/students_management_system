class CourseSession < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject

  has_many :enrollments
  has_many :students, through: :enrollments
end
