class RenameTeacherNameToTeacherIdToCourseSessions < ActiveRecord::Migration[8.1]
  def change
    rename_column :course_sessions, :teacher_name, :teacher_id
  end
end
