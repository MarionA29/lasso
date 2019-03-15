class Asso < ApplicationRecord
validates :name, presence: true
validates :description, presence: true, length: {in: 20..2000}
validates :name, presence: true #uniqueness: true
belongs_to :owner, class_name: "User"
has_one :subscription


has_one_attached :picture1
has_one_attached :picture2
has_one_attached :picture3
has_one_attached :picture4
has_one_attached :picture5
geocoded_by :address
after_validation :geocode

#after_create :ask_validation

=begin
def ask_validation
  UserMailer.asso_creation_email(self).deliver_now
  AdminMailer.validation_email(self).deliver_now
end
=end

end
