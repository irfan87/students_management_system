class ChangeTeacherIdToIntegerInCourseSessions < ActiveRecord::Migration[8.1]
  def up
    add_column :course_sessions, :teacher_id_temp, :integer

    execute <<-SQL
      UPDATE course_sessions SET teacher_id_temp = CAST(teacher_id AS integer);
    SQL

    remove_column :course_sessions, :teacher_id
    rename_column :course_sessions, :teacher_id_temp, :teacher_id
    add_foreign_key :course_sessions, :teachers
  end

  def down
    remove_foreign_key :course_sessions, :teachers
    add_column :course_sessions, :teacher_id_temp, :string

    execute <<-SQL
      UPDATE course_sessions SET teacher_id_temp = teacher_id;
    SQL

    remove_column :course_sessions, :teacher_id
    rename_column :course_sessions, :teacher_id_temp, :teacher_id
  end
end
