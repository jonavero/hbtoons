class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.string :Nombre
      t.string :Correo
      t.text :Comentario
      t.references :Serie

      t.timestamps
    end
  end
end
