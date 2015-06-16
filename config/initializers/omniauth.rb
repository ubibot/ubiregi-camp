OMNIAUTH_GOOGLE_CLIENT_ID = ENV["OMNIAUTH_GOOGLE_CLIENT_ID"]
OMNIAUTH_GOOGLE_CLIENT_SECRET = ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"]
OMNIAUTH_VALID_DOMAIN = ENV["OMNIAUTH_VALID_DOMAIN"]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, OMNIAUTH_GOOGLE_CLIENT_ID, OMNIAUTH_GOOGLE_CLIENT_SECRET, {
                           name: 'google',
                           prompt: 'select_account',
                           request_path: '/auth/google',
                           callback_path: '/oauth2callback',
                           scope: 'userinfo.email,userinfo.profile'
                         }
end

OmniAuth.config.logger = Rails.logger
