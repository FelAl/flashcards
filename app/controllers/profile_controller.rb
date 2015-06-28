class ProfileController < ApplicationController

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @current_user.update(user_params)
        format.html { redirect_to root_path, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

    def user_params
      params.require(:profile).permit(:email, :password, :password_confirmation)
    end
end
