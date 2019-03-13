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
      'localisation' => params[:localisation],
      'owner_id' => current_user.id)



      if @asso.save # essaie de sauvegarder en base
        # si ça marche, il redirige vers la page d'index du site
        flash[:success] = "Event bien créé !"

        redirect_to asso_index_path
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render asso_index_path
      end
    end
  end
