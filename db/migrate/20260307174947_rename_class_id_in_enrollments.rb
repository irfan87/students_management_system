class RenameClassIdInEnrollments < ActiveRecord::Migration[8.1]
  def change
    rename_column :enrollments, :class_id, :classroom_id
  end
end
