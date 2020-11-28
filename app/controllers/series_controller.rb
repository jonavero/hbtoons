class SeriesController < ApplicationController
  before_action :requiere_usuario_admin, only: [:inicio,:new,:edit,:delete]


  def inicio
   @Series = Serie.paginate(:page => params[:page], :per_page => 16).order(:Categoria_id)

  end

  def contacto

  end

  def index



    @Series= if params[:Titulo]
                  Serie.where('"Titulo" ILIKE ?',"%#{params[:Titulo]}%")

               elsif  params[:Categoria_id]

                    Serie.where('"Categoria_id" = ?',"#{params[:Categoria_id]}").paginate(:page => params[:page], :per_page => 16).order(:id)
                else

                  Serie.paginate(:page => params[:page], :per_page => 16).order(:id)
                end


    @SeriesProxi= Serie.paginate(:page => params[:page], :per_page => 3).where(Estatus:'Proximamente')
  end


  def show
    @Serie= Serie.find(params[:id])

    # @Episodios= @Serie.capitulos.paginate(:page => params[:page], :per_page => 20).order(:Temporada, :Episodio)    #AQUUI
    @temporadas = @Serie.capitulos
                      .where('"Serie_id" = ?',params[:id])
                      .order(:temporada_id, :id)
                      .group_by(&:temporada_id) # "1"


    @Recomendadas = Serie.all.shuffle[0..2]

    @Temporada= Temporada.find_by_sql(
        "select  't.Descripcion' from temporadas as t inner join capitulos as c
    on t.id=c.temporada_id
    where 'c.serie_id' ='5'"


    )

  end

  def new
    @Serie= Serie.new
    @Estatus=['Proximamente','Activo','Inactivo']
  end

  def create
    @Serie=Serie.new(params_serie)
    if @Serie.save
      redirect_to '/inicio'
    else
      render 'new'
    end

  end

  def edit
    @Serie=Serie.find(params[:id])
  end

  def update
    @Serie=Serie.find(params[:id])
  if @Serie.update(params_serie)
    redirect_to inicio_path, :notice=>'Registro actualizado'
  else
    render 'edit'
  end
  end

  def delete
    @Serie=Serie.find(params[:id])
    if @Serie.destroy
      redirect_to inicio_path, :notice => 'Registro eliminado'
    end
  end

  private
  def params_serie
    params.require(:serie).permit(:Titulo, :descripcion,:Idioma,:Ano,:Episodios,:Estatus,:Valoracion,:Categoria_id,:Portada,:Fondo)
  end

end
