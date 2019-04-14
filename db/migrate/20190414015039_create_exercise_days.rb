class CreateExerciseDays < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_days do |t|
      t.references :exercise, foreign_key: true
      t.references :plan, foreign_key: true
      t.integer :day
      t.text :description

      t.timestamps
    end
  end
end
