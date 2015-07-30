Rails.application.config.sorcery.submodules = [:external]
Rails.application.config.sorcery.configure do |config|
  config.external_providers = [:twitter, :facebook]

  config.twitter.key          = ENV["TWITTER_KEY"]
  config.twitter.secret       = ENV["TWITTER_SECRET"]
  # config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  if ENV["RAILS_ENV"] == "development" || ENV["RAILS_ENV"] == "test"
    app_url = "http://0.0.0.0:3000"
  else
    app_url = ""
  end
  config.twitter.callback_url = app_url + "/oauth/callback?provider=twitter"
  config.twitter.user_info_mapping = { email: "screen_name" }

  config.facebook.key =     ENV["FACEBOOK_KEY"]
  config.facebook.secret =  ENV["FACEBOOK_SECRET"]
  # config.facebook.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=facebook"
  if ENV["RAILS_ENV"] == "development" || ENV["RAILS_ENV"] == "test"
    app_url = "http://0.0.0.0:3000"
  else
    app_url = ""
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
