class FixSubjectForeignKeyInCourseSessions < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :course_sessions, :subjects, column: :subject_id
  end
end
