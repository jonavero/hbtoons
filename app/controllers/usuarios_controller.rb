class UsuariosController < ApplicationController
  before_action :requiere_usuario_admin, only: [:index,:new,:edit,:delete]


  def index
    @Usuarios =Usuario.all
  end


  def new
    @Usuario =Usuario.new
    @Estatus=['Activo','Inactivo']
  end

  def create
    @Usuario =Usuario.new(params_user)
    if @Usuario.save
      redirect_to users_path, :notice => 'Usuario creado correctamente'
    else
      render 'new'
    end
  end

  def edit
    @Usuario=Usuario.find(params[:id])
    @Estatus=['Activo','Inactivo']

  end

  def update
    @Usuario=Usuario.find(params[:id])
    if @Usuario.update(params_user)
      redirect_to login_path,:notice => 'Usuario actualizado correctamente'
    else
      render 'edit'
    end
  end

  def delete
    @Usuario=Usuario.find(params[:id])
    if @Usuario.destroy
      redirect_to users_path, :notice => 'Usuario Eliminado correctamente'
    end
  end

  private

  def params_user
    params.require(:usuario).permit(:NombreCompleto,:password,:Correo,:Estatus,:Tipo)
  end



end
