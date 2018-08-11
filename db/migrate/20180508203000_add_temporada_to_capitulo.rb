class AddTemporadaToCapitulo < ActiveRecord::Migration[5.1]
  def change
    add_reference :capitulos, :temporada, foreign_key: true
  end
end
