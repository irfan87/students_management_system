class Student < ApplicationRecord
  has_many :enrollments
  has_many :classrooms, through: :enrollments

  validates :student_name, presence: true
  enum :student_gender, { male: 0, female: 1 }
end
