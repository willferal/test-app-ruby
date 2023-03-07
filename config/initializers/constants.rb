class Constants
  KEYCLOAK_HOST               = 'https://auth.metrofor.ce.gov.br'.freeze
  KEYCLOAK_REALM              = Rails.application.credentials[Rails.env.to_sym][:keycloak][:realm]
  KEYCLOAK_LOGOUT             = "#{KEYCLOAK_HOST}/realms/#{KEYCLOAK_REALM}/protocol/openid-connect/logout".freeze
end
