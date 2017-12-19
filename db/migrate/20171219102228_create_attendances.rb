class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.date :day
      t.integer :workingHours
      t.string :status
      t.references :employee, foreign_key: true

      t.timestamps
    end
  end
end
