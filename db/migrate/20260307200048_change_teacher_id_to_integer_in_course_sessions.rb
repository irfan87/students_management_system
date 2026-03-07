class ChangeTeacherIdToIntegerInCourseSessions < ActiveRecord::Migration[8.1]
  def up
    if ActiveRecord::Base.connection.adapter_name.downcase.include?("sqlite")
      # SQLite flow: temp column
      add_column :course_sessions, :teacher_id_temp, :integer

      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id_temp = CAST(teacher_id AS INTEGER);
      SQL

      remove_column :course_sessions, :teacher_id
      rename_column :course_sessions, :teacher_id_temp, :teacher_id
    else
      # PostgreSQL flow: change_column using cast
      change_column :course_sessions, :teacher_id, :integer, using: 'teacher_id::integer'
    end

    # Add foreign key (works for both SQLite and Postgres)
    add_foreign_key :course_sessions, :teachers
  end

  def down
    remove_foreign_key :course_sessions, :teachers

    if ActiveRecord::Base.connection.adapter_name.downcase.include?("sqlite")
      # Reverse SQLite flow
      add_column :course_sessions, :teacher_id_temp, :string

      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id_temp = teacher_id;
      SQL

      remove_column :course_sessions, :teacher_id
      rename_column :course_sessions, :teacher_id_temp, :teacher_id
    else
      # Reverse PostgreSQL flow
      change_column :course_sessions, :teacher_id, :string, using: 'teacher_id::text'
    end
  end
end
