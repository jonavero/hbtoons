class CreateComentariocaps < ActiveRecord::Migration[5.1]
  def change
    create_table :comentariocaps do |t|
      t.string :Nombre
      t.string :Correo
      t.text :Comentario
      t.references :Capitulo

      t.timestamps
    end
  end
end
