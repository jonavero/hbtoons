class Usuario < ApplicationRecord

  has_secure_password

  validates :Correo, presence: {message: 'No puede dejarse vacio'},uniqueness: {message:'Ya existe'},email: {message:'Inavlido, Utilizar @/gmail/hotmail/labreferencia/.com, ejemplo: example@labreferencia.com'}
  validates :NombreCompleto, presence: {message:'No puede dejarse vacio'}
  validates :password, presence: {message:'No puede dejarse vacio'},length: {minimum: 8,maximum: 25,:message=>'El minimo de caracteres permitidos son 8'}
  validates :Tipo,:Estatus,presence: {message:'No puede dejarse vacio'}

  def admin?
    self.Tipo=='Admin'
  end


end
