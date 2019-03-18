class PrivatesMessagesController < ApplicationController

  def new
    @message = PrivateMessage.new
  end


  def create

    @message = PrivateMessage.create(sender_id:current_user.id ,
      'content' => params[:content],
      recipient_id: Asso.find(params[:asso_id]).owner_id)
      if @message.save # essaie de sauvegarder en base
        # si ça marche, il redirige vers la page d'index du site

        flash[:success] = "Ton message à bien été envoyé !"

        redirect_to root_path
      else
        # sinon, il render la view new (qui est celle sur laquelle on est déjà)
        render 'new'
      end
    end




    def show
      #variable contenant d'un cote la conversation de l'owner et de l'autre la conversation du User(non owner)
      @conversation_answer = PrivateMessage.where(sender_id: current_user.id, recipient_id:  Asso.find(params[:asso_id]).owner_id)
      @conversation_reply = PrivateMessage.where(sender_id: Asso.find(params[:asso_id]).owner_id , recipient_id: current_user.id)

      if @conversation_answer.first != nil
        #identitee de la personne questionnant et du repondant
        @answered=  User.find( @conversation_answer.first.sender_id)
        @replied = User.find( @conversation_answer.first.recipient_id)

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
