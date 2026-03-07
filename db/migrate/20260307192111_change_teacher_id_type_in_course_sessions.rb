class ChangeTeacherIdTypeInCourseSessions < ActiveRecord::Migration[8.1]
  def change
    change_column :course_sessions, :teacher_id, :integer
  end
end
