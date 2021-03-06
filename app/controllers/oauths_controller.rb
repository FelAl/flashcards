class OauthsController < ApplicationController
  skip_before_action :require_login, only: [:oauth, :callback]

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    @user = login_from(provider)
    if @user
      redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, notice: "Logged in from #{provider.titleize}!"
      rescue
        redirect_to root_path, alert:  "Failed to login "\
                                       "from #{provider.titleize}!"
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider, :oauth_token,
                  :oauth_verifier, :user_id, :uid)
  end
end
