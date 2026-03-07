class CreateClassrooms < ActiveRecord::Migration[8.1]
  def change
    create_table :classrooms do |t|
      t.string :subject_name
      t.string :teacher_name
      t.string :day_of_week
      t.timestamps
    end
  end
end
