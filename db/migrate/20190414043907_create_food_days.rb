class CreateFoodDays < ActiveRecord::Migration[5.2]
  def change
    create_table :food_days do |t|
      t.float :weight
      t.references :food, foreign_key: true
      t.references :plan, foreign_key: true
      t.text :description
      t.integer :day
      t.integer :moment

      t.timestamps
    end
  end
end
