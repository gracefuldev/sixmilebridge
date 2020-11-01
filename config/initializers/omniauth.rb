Rails.application.config.middleware.use OmniAuth::Builder do
  if Rails.env.production?
    client_id = ENV.fetch "GOOGLE_CLIENT_ID"
    client_secret = ENV.fetch "GOOGLE_CLIENT_SECRET"
    provider :google_oauth2, client_id, client_secret, skip_jwt: true
  else
    provider :developer
  end
end

OmniAuth.config.logger = Rails.logger
