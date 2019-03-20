class PrivatesMessagesController < ApplicationController
before_action :authenticate_user!

  def new
    @message = PrivateMessage.new
    @conversation_sender = PrivateMessage.where(sender_id: current_user.id, recipient_id:  Asso.find(params[:asso_id]).owner_id)
    @conversation_recipient = PrivateMessage.where(sender_id: Asso.find(params[:asso_id]).owner_id , recipient_id: current_user.id)

#identitee de la personne questionnant le sender
    @sender=  User.find( current_user.id)
#identitee de la personne du repondant le recipient
    @recipient = User.find( @conversation_sender.first.recipient_id)
        @picture_sender= User.find(current_user.id).avatar
    if User.find(@conversation_sender.first.recipient_id).profile_pic.attached? == true
      
    @picture_recipient= User.find(@conversation_sender.first.recipient_id).avatar
end

  end


  def create
    @message = PrivateMessage.new
    @conversation_sender = PrivateMessage.where(sender_id: current_user.id, recipient_id:  Asso.find(params[:asso_id]).owner_id)
    @conversation_recipient = PrivateMessage.where(sender_id: Asso.find(params[:asso_id]).owner_id , recipient_id: current_user.id)
#identitee de la personne questionnant le sender
    @sender=  User.find( current_user.id)
    if @conversation_sender.first != nil
      #identitee de la personne du repondant le recipient
      @recipient = User.find( @conversation_sender.first.recipient_id)

    end
    @message = PrivateMessage.create(sender_id:current_user.id ,
      'content' => params[:content],
      recipient_id: Asso.find(params[:asso_id]).owner_id)
      if @message.save # essaie de sauvegarder en base
        # si ça marche, il redirige vers la page d'index du site

        flash[:success] = "Ton message à bien été envoyé !"

        render 'new'
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render 'new'
      end
    end




    def show
      #variable contenant d'un cote la conversation de l'owner et de l'autre la conversation du User(non owner)
      @message = PrivateMessage.new
      @conversation_sender = PrivateMessage.where(sender_id: current_user.id, recipient_id:  Asso.find(params[:asso_id]).owner_id)
      @conversation_recipient = PrivateMessage.where(sender_id: Asso.find(params[:asso_id]).owner_id , recipient_id: current_user.id)
  #identitee de la personne questionnant le sender
      @sender=  User.find( current_user.id)
      if @conversation_sender.first != nil
        #identitee de la personne du repondant le recipient
        @recipient = User.find( @conversation_sender.first.recipient_id)

      end
    end



    def index
      @conversations = PrivateMessage.where(sender_id: current_user.id)

    end
 end



  def info_asso(object)
    Asso.where(owner_id: object.recipient_id).first

  end
  def last_msg(object)
 return @conversations.where(recipient_id: object.recipient_id).last.content
  end
