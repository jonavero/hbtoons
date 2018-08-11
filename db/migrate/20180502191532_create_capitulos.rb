class CreateCapitulos < ActiveRecord::Migration[5.1]
  def change
    create_table :capitulos do |t|

      t.string :Titulo
      t.string :Temporada
      t.string :Video
      t.text :Descripcion
      t.integer :Episodio
      t.references :Serie

      t.timestamps
    end
  end
end
