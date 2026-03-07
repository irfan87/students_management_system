class AddParentNameStudentBirthDateAndStudentPhoneNumberIntoStudents < ActiveRecord::Migration[8.1]
  def change
    change_table :students do |t|
      t.string :parent_name
      t.date :student_birth_date
      t.string :student_phone_number
    end
  end
end
