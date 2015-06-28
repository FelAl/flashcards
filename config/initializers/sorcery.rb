Rails.application.config.sorcery.submodules = [:external]
Rails.application.config.sorcery.configure do |config| 

  config.external_providers = [:twitter, :facebook]

  config.twitter.key          = Rails.application.secrets.twitter_key
  config.twitter.secret       = Rails.application.secrets.twitter_secret
  # config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  if ENV["RAILS_ENV"] == "development" or ENV["RAILS_ENV"] == "test"
    app_url = "http://0.0.0.0:3000"
  end
  config.twitter.callback_url = app_url + "/oauth/callback?provider=twitter"
  config.twitter.user_info_mapping = { email: "screen_name" }

  config.facebook.key =          Rails.application.secrets.facebook_key
  config.facebook.secret =       Rails.application.secrets.facebook_secret
  # config.facebook.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=facebook"
  if ENV["RAILS_ENV"] == "development" or ENV["RAILS_ENV"] == "test"
    app_url = "http://0.0.0.0:3000"
  end
  config.facebook.callback_url = app_url + "/oauth/callback?provider=facebook"
  config.facebook.user_info_mapping = { email: "email" } 
  config.facebook.scope = "email" 
  
  # --- user config ---
  config.user_config do |user|
    # -- external --
    user.authentications_class = Authentication
  end
  config.user_class = "User"
end
