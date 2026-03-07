class DropClasses < ActiveRecord::Migration[8.1]
  def change
    drop_table :classes
  end
end
