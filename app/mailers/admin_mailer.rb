class AdminMailer < ApplicationMailer

def new_user_email
  mail(to:"admin@lasso.com",subject: "Un nouvel utilisateur!")
end
def validation_email
  mail(to:"admin@lasso.com",subject: "Demande de validation d'une nouvelle asso")
end
def new_subscription_email
  mail(to:"admin@lasso.com", subject: "Souscription validée, une nouvelle asso à mettre en ligne!")
end

end
