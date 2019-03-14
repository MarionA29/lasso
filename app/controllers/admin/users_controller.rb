class Admin::UsersController < Admin::ApplicationController
  def index
    @user = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    post_params = params.require(:user).permit(:first_name, :last_name, :description, :profile_pic)
    @user.update(post_params)
    if @user.update(post_params)
      redirect_to admin_user_path
    else
      render :edit
    end
  end
end
