class FixEnrollmentForiegnKey < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :enrollments, column: :classroom_id
    add_foreign_key :enrollments, :classrooms, column: :classroom_id
  end
end
