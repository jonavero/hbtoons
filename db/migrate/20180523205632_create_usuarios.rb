class CreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table :usuarios do |t|

      t.string :NombreCompleto
      t.string :Correo
      t.string :Estatus
      t.string :Tipo
      t.string :password_digest

      t.timestamps
    end
  end
end
