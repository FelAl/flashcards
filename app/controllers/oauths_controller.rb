class OauthsController < ApplicationController
  skip_before_action :require_login, only: [:oauth, :callback]

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      puts "login"
      redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
    else
      puts "not login"
      begin
        @user = create_from(provider)
        puts @user
        puts "--------------------------------------"
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, alert:  "Failed to login from #{provider.titleize}!"
      end
    end
  end

  #example for Rails 4: add private method below and use "auth_params[:provider]" in place of 
  #"params[:provider] above.

  private
  def auth_params
    params.permit(:code, :provider, :oauth_token, :oauth_verifier, :user_id, :uid)
  end

end