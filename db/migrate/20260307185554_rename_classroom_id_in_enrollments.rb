class RenameClassroomIdInEnrollments < ActiveRecord::Migration[8.1]
  def change
    rename_column :enrollments, :classroom_id, :course_session_id
  end
end
