class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.integer :codice
      t.string :descrizione
      t.string :immagine
      t.string :nomeimmagine
      t.integer :gruppo1
      t.integer :gruppo2
      t.integer :accesso
      t.integer :livello
      t.string :fotoGA
      t.string :fotoGB
      t.string :fotoA
      t.string :fotoB
      t.string :mappa
      t.string :mappe
      t.string :video
      t.integer :codicegruppo1

      t.timestamps
    end
  end
end
