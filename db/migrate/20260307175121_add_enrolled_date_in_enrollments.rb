class AddEnrolledDateInEnrollments < ActiveRecord::Migration[8.1]
  def change
    add_column :enrollments, :enrolled_date, :date
  end
end
