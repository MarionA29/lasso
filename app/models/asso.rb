class Asso < ApplicationRecord
validates :name, presence: true
validates :description, presence: true, length: {in: 20..2000}
validates :name, presence: true #uniqueness: true

belongs_to :owner, class_name: "User"
has_one :subscription
has_many_attached :picture
after_create :ask_validation

def ask_validation
  UserMailer.asso_creation_email(self).deliver_now
  AdminMailer.validation_email(self).deliver_now
end

geocoded_by :address
after_validation :geocode
end
