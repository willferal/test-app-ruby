class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: :keycloakopenid

  def keycloakopenid
    @user = User.from_omniauth(request.env["omniauth.auth"])
    flash.delete(:alert) if flash[:alert].eql?('--')
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      flash[:error] = 'Erro na tentativa de login com Metrodata, favor tente novamente.'
      session["devise.keycloakopenid_data"] = request.env["omniauth.auth"]
      redirect_to new_user_session_url
    end
  end

  def failure
    redirect_to root_path
  end
end