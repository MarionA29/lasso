class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

=begin
  def validation_email(owner)
    @owner = asso.owner
    mail(to: @owner.email, subject: "Validation en cours")
  end

  def unvalidated_email
  @owner = asso.owner
  mail(to: @owner.email, subject: "Création non validée")

  end

  def subscription_email
    @owner = asso.owner
    mail(to: @owner.email, subject: "Validation de la création")
  end

  def payment_complete_email
    @owner = asso.owner
    mail(to: @owner.email, subject: "Paiement validé")
  end
=end

end
