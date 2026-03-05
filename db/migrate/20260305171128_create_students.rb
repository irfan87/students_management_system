class CreateStudents < ActiveRecord::Migration[8.1]
  def change
    create_table :students do |t|
      t.string :student_name
      t.integer :student_age
      t.text :student_address

      t.timestamps
    end
  end
end
