class AdminMailer < ApplicationMailer
def new_user_email
  mail(to:"marionaudren@live.fr",subject: 'Commande validée! ')
end
    def validation_email
      mail(to:"marionaudren@live.fr",subject: "Demande de validation d'une nouvelle asso")
    end
end
