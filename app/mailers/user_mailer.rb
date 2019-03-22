class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end


  def validation_email(owner)
<<<<<<< HEAD
    @owner = User.find(owner.id)
    mail(to: @owner.email, subject: "Validation en cours")
  end

  def unvalidated_email
=======
>>>>>>> bfe1552e04e0f1add5bd3a2b87388230d97d37ad
  @owner = asso.owner
  mail(to: @owner.email, subject: "Validation en cours")
end

def unvalidated_email
@owner = asso.owner
mail(to: @owner.email, subject: "Création non validée")

end

<<<<<<< HEAD
  def payment_complete_email
    @owner = asso.owner
    mail(to: @owner.email, subject: "Paiement validé")
  end
=======
def subscription_email
@owner = asso.owner
mail(to: @owner.email, subject: "Validation de la création")
end

def payment_complete_email
@owner = asso.owner
mail(to: @owner.email, subject: "Paiement validé")
end
=end

>>>>>>> bfe1552e04e0f1add5bd3a2b87388230d97d37ad
end
