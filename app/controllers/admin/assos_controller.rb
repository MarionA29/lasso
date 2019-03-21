class Admin::AssosController < Admin::ApplicationController
  def index
    @asso = Asso.all
  end
  def edit
    @asso = Asso.find(params[:id])
  end
  def update
    @asso = Asso.find(params[:id])
    post_params = params.require(:asso).permit(:name, :description, :key_figures, :infos, :address, :picture1, :picture2, :picture3, :picture4, :picture5)
    @asso.update(post_params)
    if @asso.update(post_params)
      redirect_to admin_asso_path(@asso.id)
    else
      render :edit
    end
  end
  def destroy
    @asso = Asso.find(params[:id])
    @asso.destroy
    redirect_to admin_root_path
  end
end
