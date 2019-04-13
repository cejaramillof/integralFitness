class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.references :user, foreign_key: true
      t.references :guest, foreign_key: true
      t.float :weight
      t.float :fat
      t.integer :activity
      t.integer :goal
      t.float :muscle_mass
      t.float :fat_mass
      t.float :skeletal_mass
      t.float :residual_mass
      t.float :lean_mass
      t.integer :kcal
      t.integer :proteins
      t.integer :carbs
      t.integer :fats
      t.text :description

      t.timestamps
    end
  end
end
