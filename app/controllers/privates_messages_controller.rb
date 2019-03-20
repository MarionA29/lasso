class PrivatesMessagesController < ApplicationController
before_action :authenticate_user!

  def new
    @message = PrivateMessage.new

  end


  def create
    @message = PrivateMessage.new

    @message = PrivateMessage.create(sender_id: current_user.id ,
      'content' => params[:content],
      recipient_id: params[:privates_message_id] )

      if @message.save # essaie de sauvegarder en base
        # si ça marche, il redirige vers la page d'index du site
        flash[:success] = "Ton message à bien été envoyé !"

      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        flash[:alert] = "Ton message... !"

      end
    end




    def show
      @recipient = User.find( params[:privates_message_id])
      @sender = User.find(current_user.id)
      @all_message_sender= PrivateMessage.where(sender_id: current_user.id, recipient_id: User.find(params[:privates_message_id]))
      @all_message_recipient =PrivateMessage.where(sender_id: @recipient.id, recipient_id: current_user.id)
      @message = PrivateMessage.new

    end



    def index
      @message_recipient= PrivateMessage.where(recipient_id: current_user.id)
      @message_sent= PrivateMessage.where(sender_id: current_user.id)

    end
 end
 def user_info(object)
   return User.find(object)
 end
