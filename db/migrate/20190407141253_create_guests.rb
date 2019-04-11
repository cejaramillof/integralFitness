class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :cc
      t.string :email
      t.string :name
      t.string :phone
      t.boolean :gender
      t.integer :height
      t.date :dob
      t.date :next
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
