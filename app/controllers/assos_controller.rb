class AssosController < ApplicationController
  def index
    @assos = Asso.all
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
        @asso = Asso.last
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
  end
