class ChangeTeacherIdToIntegerInCourseSessions < ActiveRecord::Migration[8.1]
  def up
    # Make sure no invalid data exists first
    execute <<-SQL
      UPDATE course_sessions
      SET teacher_id = NULL
      WHERE teacher_id !~ '^\d+$';
    SQL

    # Change column type using proper cast
    change_column :course_sessions, :teacher_id, :integer, using: 'teacher_id::integer'

    # Add foreign key
    add_foreign_key :course_sessions, :teachers
  end

  def down
    remove_foreign_key :course_sessions, :teachers

    change_column :course_sessions, :teacher_id, :string, using: 'teacher_id::text'
  end
end
