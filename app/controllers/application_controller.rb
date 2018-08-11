class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  helper_method :current_user

  def current_user
    @current_user ||= Usuario.find(session[:user_id]) if session[:user_id]
  end
  def requiere_usuario
    redirect_to '/login' unless current_user
  end
  def requiere_usuario_admin
    redirect_to '/login' unless current_user
  end
end
