class RenameClassroomToCourseSession < ActiveRecord::Migration[8.1]
  def change
    rename_table :classrooms, :course_sessions
  end
end
