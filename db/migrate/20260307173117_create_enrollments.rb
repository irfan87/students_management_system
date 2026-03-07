class CreateEnrollments < ActiveRecord::Migration[8.1]
  def change
    unless table_exists?(:enrollments)
      create_table :enrollments do |t|
        t.references :student, null: false, foreign_key: true
        t.references :classroom, null: false, foreign_key: true
        t.date :enrolled_at
        t.string :status
        t.timestamps
      end
    end
  end
end
