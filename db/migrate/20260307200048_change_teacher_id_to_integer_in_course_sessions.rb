class ChangeTeacherIdToIntegerInCourseSessions < ActiveRecord::Migration[8.1]
  def up
    # 1. Add a new integer column
    add_column :course_sessions, :teacher_id_temp, :integer

    # 2. Copy data from old string column to new integer column
    if ActiveRecord::Base.connection.adapter_name.downcase.include?("sqlite")
      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id_temp = CAST(teacher_id AS INTEGER);
      SQL
    else
      # PostgreSQL
      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id_temp = teacher_id::integer;
      SQL
    end

    # 3. Remove old string column
    remove_column :course_sessions, :teacher_id

    # 4. Rename new column
    rename_column :course_sessions, :teacher_id_temp, :teacher_id

    # 5. Add foreign key
    add_foreign_key :course_sessions, :teachers
  end

  def down
    remove_foreign_key :course_sessions, :teachers

    add_column :course_sessions, :teacher_id_temp, :string

    execute <<-SQL
      UPDATE course_sessions
      SET teacher_id_temp = teacher_id;
    SQL

    remove_column :course_sessions, :teacher_id
    rename_column :course_sessions, :teacher_id_temp, :teacher_id
  end
end
