class AddGenderToStudents < ActiveRecord::Migration[8.1]
  def change
    add_column :students, :student_gender, :integer, default: 0, null: false
  end
end
