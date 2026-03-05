class Student < ApplicationRecord
  validates :student_name, presence: true
end
