class CreateSubjects < ActiveRecord::Migration[8.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :level
      t.string :description

      t.timestamps
    end
  end
end
