class ApplicationController < ActionController::Base
  include Turbo::SafeRedirection
  
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_paper_trail_whodunnit
  before_action :load_modules

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nome, :cpf, :login])
  end

  def load_modules
    #TODO Aplicar cache de modulos
    return unless user_signed_in?

    @modulos_ativos = Modulo.active
  rescue StandardError => e
    @modulos_ativos = []
  end
end
