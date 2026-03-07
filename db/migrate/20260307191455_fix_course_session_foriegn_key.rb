class FixCourseSessionForiegnKey < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :course_sessions, :teachers, column: :teacher_id
  end
end
