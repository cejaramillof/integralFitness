class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :status
      t.string :group
      t.string :carbohydrates
      t.string :proteins
      t.string :fats
      t.boolean :default
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
