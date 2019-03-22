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
      'asso_id' => params[:asso_id])

      if @new.save
        @new.news_picture.attach(params[:news_picture])
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
      @new = New.find(params[:id])
    end

    def update
      @new = New.find(params[:id])
      #post_params = params.require(:new).permit(:title, :content, :date)
      # @new.update(post_params)
      if @new.update title: params[:new][:title]
        @new.news_picture.attach(params[:news_picture])
        redirect_to user_path(current_user.id)
      else
      end

    end

    def destroy
    end
  end
