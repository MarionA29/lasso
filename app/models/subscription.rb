class Subscription < ApplicationRecord
  belongs_to :asso
end


after_create :subscription_email

def subscription_email
  UserMailer.payment_complete_email(self).deliver_now
  AdminMailer.new_subscription_email(self).deliver_now
end
