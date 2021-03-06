class Admin::UsersController < Admin::ApplicationController
  def index
    @user = User.all
  end
  def show
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
      redirect_to admin_user_path(@user.id)
    else
      render :edit
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_root_path
  end
end
