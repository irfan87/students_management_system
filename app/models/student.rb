class Student < ApplicationRecord
  has_many :enrollments
  has_many :course_sessions, through: :enrollments

  validates :student_name, presence: true
  enum :student_gender, { male: 0, female: 1 }
end
