class RenameParentNameToStudentParentNameInStudents < ActiveRecord::Migration[8.1]
  def change
    rename_column :students, :parent_name, :student_parent_name
  end
end
