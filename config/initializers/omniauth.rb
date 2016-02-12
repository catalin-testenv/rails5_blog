Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
    skip_jwt: true,
    name: 'google',
    scope: 'email, profile',
    prompt: 'select_account',
    image_aspect_ratio: 'square',
    image_size: 50

end
OmniAuth.config.full_host = "http://#{ENV['HOST']}:#{ENV['PORT']}"