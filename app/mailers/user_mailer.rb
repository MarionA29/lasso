class UserMailer < ApplicationMailer

  def welcome_email(current_user)
    @user = current_user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def asso_creation_email(owner)
    @owner = asso.owner
    mail(to: @owner.email, subject: "Création de l'asso")
  end

  def subcription_email
    @owner = asso.owner
    mail(to: @owner.email, subject: "Validation de la création")
  end

  def payment_complete_email
    @owner = asso.owner
    mail(to: @owner.email, subject: "Paiement validé")

  end
end
