class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if @current_user.update(user_params)
      redirect_to root_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  def user_params
    params.require(:profile).permit(:email, :password, :password_confirmation)
  end
end
