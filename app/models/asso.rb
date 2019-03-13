class Asso < ApplicationRecord
validates :name, presence: true
validates :description, presence: true, length: {in: 20..2000}
belongs_to :owner, class_name: "User"
has_one :subscription
has_many_attached :picture
after_create :ask_validation

def ask_validation
  UserMailer.asso_creation_email(self).deliver_now
  AdminMailer.validation_email(self).deliver_now
end

end
