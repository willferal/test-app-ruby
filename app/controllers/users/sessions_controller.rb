# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  layout 'sign'
  # GET /resource/sign_in
  def new
    redirect_to user_keycloakopenid_omniauth_authorize_path
  end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  def destroy
    current_user.logout_keycloak
    reset_session
    (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    redirect_to root_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
