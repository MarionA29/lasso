class AssosController < ApplicationController
  before_action :user_match, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create]


  def index
    if @assos = Asso.search(params[:term])
    else "puts not found"
    end
  end
  def new
    @asso = Asso.new
  end

  def create
    @asso = Asso.create('name' => params[:name],
      'description' => params[:description],
      'key_figures' => params[:key_figures],
      'infos' => params[:infos],
      'address' => params[:address],
      'owner_id' => current_user.id)


      if @asso.save # essaie de sauvegarder en base
        # si ça marche, il redirige vers la page d'index du site
        
        @asso.picture1.attach(params[:picture1])
        @asso.picture2.attach(params[:picture2])
        @asso.picture3.attach(params[:picture3])
        @asso.picture4.attach(params[:picture4])
        @asso.picture5.attach(params[:picture5])
        flash[:success] = "Ton associaiton à bien été créée !"

        redirect_to root_path
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render 'new'
      end
    end

    def show
      if params[:id].to_i != current_user.id
      @asso= Asso.find(params[:id])
    else
      @asso= Asso.where(owner_id: current_user.id).first
    end

    end

    def edit
      @asso= Asso.where(owner_id: current_user.id).first

    end

    def update

      @asso= Asso.where(owner_id: current_user.id).first
      post_params = params.require(:asso).permit(:name, :description, :key_figures, :infos, :address, :picture1, :picture2, :picture3, :picture4, :picture5)

      @asso.update(post_params)
      if @asso.update(post_params)
        redirect_to  user_path(current_user.id)
      end

    end

    def destroy
        @asso = User.find(owner_id= current_user.id)
        @user.destroy
        redirect_to root_path
    end

      def asso_params
          params.require(:asso).permit(:name, :description, :key_figures, :infos, :address, :term)
      end

    private
    def user_match
      @asso = User.find(owner_id= current_user.id)
      @user = @asso.id
      unless current_user.id == @user
        redirect_to event_index_path
      end
    end
  end
