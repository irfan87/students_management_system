class RenameSubjectNameToSubjectIdToCourseSessions < ActiveRecord::Migration[8.1]
  def change
    rename_column :course_sessions, :subject_name, :subject_id
  end
end
