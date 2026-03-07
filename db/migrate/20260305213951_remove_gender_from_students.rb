class RemoveGenderFromStudents < ActiveRecord::Migration[8.1]
  def change
    remove_column :students, :gender, :integer
  end
end
