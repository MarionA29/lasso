class Subscription < ApplicationRecord
  belongs_to :asso
end


<<<<<<< HEAD
# after_create :subscription_email
#
# def subscription_email
#   UserMailer.payment_complete_email(self).deliver_now
#   AdminMailer.new_subscription_email(self).deliver_now
# end
=======
def subscription_email
UserMailer.payment_complete_email(self).deliver_now
AdminMailer.new_subscription_email(self).deliver_now
end
=end
>>>>>>> bfe1552e04e0f1add5bd3a2b87388230d97d37ad
