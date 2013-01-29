Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
  
  # TODO: Should this be put into environment variables on the server?
  provider :facebook, '136321823103502', '8be6e5aca524f0e68378f054739648eb', :display => 'popup'

  # Mention other providers here you want to allow user to sign in with
end
