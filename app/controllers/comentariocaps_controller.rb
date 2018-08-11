class ComentariocapsController < ApplicationController


  def create

    @Comentario=Comentariocap.new(params_comentario)
    if @Comentario.save
      redirect_to '/'
    else

    end
  end





  private

  def params_comentario
    params.require(:comentariocap).permit(:Nombre,:Correo,:Comentario,:Capitulo_id)
  end
end
