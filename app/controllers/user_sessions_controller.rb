class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to(:root, notice: "Login successful")
    else
      flash.now[:alert] = "Login failed"
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:root, notice: "Logged out!")
  end
end
