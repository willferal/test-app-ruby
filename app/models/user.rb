class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable,
         :trackable, :omniauthable, omniauth_providers: %i[keycloakopenid]

  def self.from_omniauth(auth)
    auth = JSON.parse auth.to_json, object_class: OpenStruct
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email            = auth.info.email
      user.nome             = auth.info.name
      user.login            = auth.extra.raw_info.preferred_username
      user.cpf              = auth.info.cpf
      user.password         = Devise.friendly_token[0, 20]
      user.access_token     = auth.credentials.token
      user.refresh_token    = auth.credentials.refresh_token
      user.save
    end
  end

  def logout_keycloak
    params = {refresh_token: refresh_token,
      client_id: Rails.application.credentials[Rails.env.to_sym][:keycloak][:client_id],
      client_secret: Rails.application.credentials[Rails.env.to_sym][:keycloak][:client_secret]
    }
    RestClient.post Constants::KEYCLOAK_LOGOUT, params
  end

end
