Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config| 


  config.external_providers = [:twitter]

  config.twitter.key = "t45chtlC5twRxh1v766Ec44gw"
  config.twitter.secret = "VMKb2Imnvgdg2WIkYGpKaKBQTPRBzDfx1OqGjTC9l9SEzJN2fW"
  config.twitter.callback_url = "http://0.0.0.0:3000/oauth/callback?provider=twitter"
  config.twitter.user_info_mapping = {:username => "screen_name"}
  # --- user config ---
  config.user_config do |user|
    # -- external --
    user.authentications_class = Authentication
  end
  config.user_class = "User"
end
