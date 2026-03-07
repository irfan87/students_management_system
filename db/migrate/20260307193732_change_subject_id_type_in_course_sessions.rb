class ChangeSubjectIdTypeInCourseSessions < ActiveRecord::Migration[8.1]
  def change
    change_column :course_sessions, :subject_id, :integer
  end
end
