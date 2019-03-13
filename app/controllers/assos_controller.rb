class AssosController < ApplicationController
  def index
    @assos = Asso.all
  end

  def new
    @asso = Asso.find(params[:id])

  end

  def create

  end
end
