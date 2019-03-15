class Admin::ValidationController < Admin::ApplicationController
  def index
    @asso_validate = Asso.where(validated: nil)
  end

  def show
    @asso = Asso.find(params[:id])
  end

  def edit
    @asso = Asso.find(params[:id])
  end

  def update
      @asso = Asso.find(params[:id])
      @asso.update_attribute(:validated, params[:decision])
      redirect_to admin_validation_path
  end
end
