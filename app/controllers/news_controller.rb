class NewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @news = New.all
  end

  def show
    @new = New.find(params[:id])
  end

  def new
    @new = New.new
  end

  def create
    @new = New.create('title' => params[:title],
      'content' => params[:content],
      'date' => params[:date],
      'asso_id' => @asso.id)

      if @new.save
        #Attach picture to do
        flash[:success] = "Ta news a bien été créée !"
        redirect_to root_path
      else
        flash[:error] = "Ta news n'a pas été créée !"
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render 'new'
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
