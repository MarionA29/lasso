class Admin::AssosController < Admin::ApplicationController
  def index
    @asso = Asso.all
  end
end
