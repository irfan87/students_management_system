class Student < ApplicationRecord
  validates :student_name, presence: true
  enum :student_gender, { male: 0, female: 1 }
end
