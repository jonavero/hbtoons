class Serie < ApplicationRecord
has_many :capitulos,:foreign_key => 'Serie_id'
has_many :comentarios
belongs_to :categorium,optional: true

  has_attached_file :Portada, style:{medium: '200x200', thumb:'48x48'}
  validates_attachment_content_type :Portada, content_type: /\Aimage\/.*\z/

  has_attached_file :Fondo, style:{medium: '200x200', thumb:'48x48'}
  validates_attachment_content_type :Fondo, content_type: /\Aimage\/.*\z/


end
