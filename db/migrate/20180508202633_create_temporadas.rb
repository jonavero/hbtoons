class CreateTemporadas < ActiveRecord::Migration[5.1]
  def change
    create_table :temporadas do |t|
      t.string :Descripcion

      t.timestamps
    end
  end
end
