class CapitulosController < ApplicationController
  before_action :requiere_usuario_admin, only: [:new,:edit,:delete]

  def show

    @Capitulo= Capitulo.find(params[:id])
    @Cabecera=Serie.find_by(id: @Capitulo.Serie_id)

    @Recomendadas=Serie.all.shuffle[0..2]


    @Episodios=Capitulo.where('"Serie_id" = ?',@Capitulo.Serie_id).paginate(:page => params[:page], :per_page => 20).order(:Temporada, :Episodio)  #AQUI


    @Comentario = Comentariocap.new


   @Comentarios = Comentariocap.where('"Capitulo_id" = ?',@Capitulo.id)

    @Count= @Comentarios.length
   # @Comentarios=Comentariocap.find_by(:Capitulo_id ==@Capitulo.id)

  end

  def new
    @Capitulo=Capitulo.new
  end

  def create
    @Capitulo= Capitulo.new(params_capitulo)
    if @Capitulo.save
      redirect_to inicio_path, :notice => 'Capitulo Registrado'
    else
      render 'new'
    end
  end

  def edit
    @Capitulo=Capitulo.find(params[:id])
  end

  def update
    @Capitulo=Capitulo.find(params[:id])
    if @Capitulo.update(params_capitulo)
      redirect_to inicio_path
    else
      render 'edit'
    end
  end

  def delete
    @Capitulo= Capitulo.find(params[:id])
    if @Capitulo.destroy
      redirect_to inicio_path,:notice => 'Capitulo eliminado'
    end
  end



  private
  def params_capitulo
    params.require(:capitulo).permit(:Titulo,:Temporada,:Video,:Descripcion,:Episodio,:Serie_id,:temporada_id)
  end

end
