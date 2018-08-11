class CreateSeries < ActiveRecord::Migration[5.1]
  def change
    create_table :series do |t|

      t.string :Titulo
      t.string :descripcion
      t.string :Idioma
      t.integer :Ano
      t.integer :Episodios
      t.string :Estatus
      t.integer :Valoracion
      t.references :Categoria

      t.timestamps
    end

    add_attachment :series,:Portada
    add_attachment :series,:Fondo
  end
end
