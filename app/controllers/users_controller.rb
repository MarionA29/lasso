class UsersController < ApplicationController


  before_action :user_match, only: [:show, :edit, :update]

  def show
    @user = current_user
  end
  def edit
    @user = current_user
  end
  def update
      @user = current_user
    post_params = params.require(:user).permit(:first_name, :last_name, :description, :profile_pic)
    @user.update(post_params)
    if @user.update(post_params)
      redirect_to  user_path(current_user.id)
    end
  end


  def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to current_user_path
  end
  private
  def user_match
    @user = current_user
    unless current_user.id == @user.id
      redirect_to root_path
    end
  end
end
