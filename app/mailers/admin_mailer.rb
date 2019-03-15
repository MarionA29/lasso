class AdminMailer < ApplicationMailer
def new_user_email(admin)
  mail(to:"marionaudren@live.fr",subject: 'Un nouvel utilisateur! ')
end
def validation_email
  mail(to:"marionaudren@live.fr",subject: "Demande de validation d'une nouvelle asso")
end
end
