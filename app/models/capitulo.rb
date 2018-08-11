class Capitulo < ApplicationRecord
  belongs_to :serie,optional: true
  belongs_to :temporada
  has_many :comentariocaps

  validates :Titulo ,presence:true

end
