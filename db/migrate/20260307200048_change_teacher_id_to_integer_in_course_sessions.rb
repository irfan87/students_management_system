class ChangeTeacherIdToIntegerInCourseSessions < ActiveRecord::Migration[8.1]
  def up
    # 1️⃣ Add temporary integer column
    add_column :course_sessions, :teacher_id_temp, :integer

    adapter = ActiveRecord::Base.connection.adapter_name.downcase

    if adapter.include?("sqlite")
      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id_temp = CAST(teacher_id AS INTEGER);
      SQL

    elsif adapter.include?("postgresql")
      # Remove invalid values before casting
      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id = NULL
        WHERE teacher_id !~ '^[0-9]+$';
      SQL

      execute <<-SQL
        UPDATE course_sessions
        SET teacher_id_temp = teacher_id::integer;
      SQL
    end

    # 3️⃣ Remove old column
    remove_column :course_sessions, :teacher_id

    # 4️⃣ Rename temp column
    rename_column :course_sessions, :teacher_id_temp, :teacher_id

    # 5️⃣ Add foreign key
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
